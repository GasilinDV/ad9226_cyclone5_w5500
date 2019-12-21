module w5500_fpga #(parameter LENGTH_UDP = 9'd245) (
    input clk, // 50 mhz clock input
	 
	 //ad9226
	 input  [11:0] data_a_in,
	 output 			aclk,	//clock ADC

	 //spi interface w5500
    output eth_spi_mosi,
    input  eth_spi_miso,
    output eth_spi_ss_n,
    output eth_spi_sck,
	 
	 //reset_n for 
	 input  key_1,
	 output eth_rst,
	 output led
    );

`include "wiznet5500_parameters.sv"  //all parameters for config w5500

reg [11:0]	data_adc9226;
reg [47:0] 	data_to_fifo;	// accumulate data (x3 example)

reg 			fifo_read_enabled; // fifo read
wire [47:0] fifo_data_out;
wire 			fifo_write_enabled;		// fifo write
wire 			fifo_empty;					// fifo empty
wire 			fifo_full;					// fifo full
wire 			fifo_data_out_valid;

// Buffer holds data from the fifo until we hand
// the data off to the ethernet module.
reg [47:0] 	buffer = 48'b0;
reg 			buffer_valid = 1'b0;

// Used to flush data from the ehternet module
// every so often
reg [7:0] 	counter = 8'd0;
reg 			flush_requested = 1'b0;	// request flush data from w5500
reg [47:0] 	data_to_ethernet = 48'b111111000000_111111000000_111111000000_111111000000;		// data to w5500 example
reg 			data_out_valid = 1'b0;
wire 			ethernet_available;	// Is the ethernet accessible?
reg 			has_pushed_samples = 1'b0;
wire [47:0] sample_values; 	// selection

reg 			signal_ad9226;
reg 			signal_wiznet5500;

assign aclk = clk;	// adc clock = 50 mhz

wiznet5500 #(.LENGTH_UDP(LENGTH_UDP))  eth_iface (
    .clk(clk),
    .miso(eth_spi_miso),
    .mosi(eth_spi_mosi),
    .spi_clk(eth_spi_sck),
    .spi_chip_select_n(eth_spi_ss_n),
    .is_available(ethernet_available),
	 .data_input(data_to_ethernet),
	 .data_input_valid(data_out_valid),
	 .flush_requested(flush_requested),
    .fifo_read_enabled(fifo_read_enabled),
    .fifo_empty(fifo_empty),
    .signal_from_ad9226(signal_ad9226),
    .signal_to_ad9226(signal_wiznet5500)
);


fifo #(.LENGTH_UDP(LENGTH_UDP)) fifo
(
    .clk(clk),
    .data_in(data_to_fifo), //sample_values
    .data_out(fifo_data_out),
    .write_enabled(fifo_write_enabled),
    .read_enabled(fifo_read_enabled),
    .fifo_empty(fifo_empty),
    .fifo_full(fifo_full),
    .data_out_valid(fifo_data_out_valid)
);

adc_data_sync adc_sync
(
	.sys_clk (clk),
	.reset_n (eth_rst), 		   //0 -> active
	.data_in (data_a_in), 	   //12 bits in
	.data_out (data_adc9226) 	
);

ad9226_data #(.LENGTH_UDP(LENGTH_UDP)) ad9226 (
		.sys_clk (clk), 
		.reset_n (eth_rst),
		.fifo_full (fifo_full),
		.fifo_write_enable (fifo_write_enabled),
		.data_in (data_adc9226),
		.data_out (data_to_fifo),
      .signal_from_wiznet5500(signal_wiznet5500),
      .signal_to_wiznet5500(signal_ad9226)
);

// reset_n by button
always @ (posedge clk) begin
	if (!key_1) begin
		eth_rst <= 1'b0;
		led <= 1'b0;
	end
	else begin
		eth_rst <= 1'b1;
		led <= 1'b1;
	end
end

// Take sample data from the fifo and push it to the ethernet module.
// Every so often, ask the ethernet module to send the contents of its
// TX buffer.
always @(posedge clk) begin
	data_out_valid <= 1'b0;			// data ok and can be transferred
	data_to_ethernet <= data_to_ethernet;
   has_pushed_samples <= has_pushed_samples;
	flush_requested <= 1'b0;
	counter <= counter;   
   buffer_valid <= buffer_valid;
   buffer <= buffer;
   
   if (fifo_data_out_valid == 1'b1 && buffer_valid == 1'b0) begin		// if there is valid data
      buffer <= fifo_data_out;
      buffer_valid <= 1'b1;

   end else if (ethernet_available) begin
		if (counter % LENGTH_UDP == 0 && has_pushed_samples == 1'b1) begin //if counter == 32
         // After pushing data into the ethernet module for a while,
         // request that the data be sent out.
         flush_requested <= 1'b1;
			has_pushed_samples <= 1'b0;
         counter <= 1'b0;
		end else if (buffer_valid == 1'b1) begin
         data_to_ethernet <= buffer;	// data from the buffer is placed in a data_to_ethernet
			counter <= counter + 1'b1;		// count to 255
			has_pushed_samples <= 1'b1;
			data_out_valid <= 1'b1;
         buffer_valid <= 1'b0;
		end
	end
end

endmodule


module ad9226_data # (
		parameter ADC_BITS = 12,
		parameter SAMPLES = 4,	//меняем размер накапливаемых данных
      parameter LENGTH_UDP = 9'd245 
) (
		input											sys_clk, 
		input 										reset_n,
		input 										fifo_full,
		input			[ADC_BITS-1:0] 			data_in,
		
		output reg									fifo_write_enable,
		output reg 	[ADC_BITS*SAMPLES-1:0] 	data_out,
        
      input                               signal_from_wiznet5500,
      output reg                          signal_to_wiznet5500 = 1'b0
);

reg [47:0] 				data_send;
reg [SAMPLES - 1:0] 	sample_counter = {SAMPLES{1'b0}};
reg [8:0] 				fifo_full_count = 9'd0; //need 254 samples
reg flag = 1'b1;

always @(posedge sys_clk) begin: SPI_OPERATION
   if (!reset_n) begin
		fifo_write_enable <= 1'b0;
		data_out <= 48'd0;
	end
	else begin
	fifo_write_enable <= 1'b0;
   data_out <= data_out;
	data_send <= {data_send[35:0], data_in};	
	sample_counter = sample_counter + 1'b1;
	signal_to_wiznet5500 <= 1'b0;
    
	if (fifo_full_count == LENGTH_UDP && flag == 1'b1) begin
		flag <= 1'b0;
		signal_to_wiznet5500 <= 1'b1;
	end
	
   if (fifo_full_count == LENGTH_UDP) begin
		fifo_write_enable <= 1'b0;
		data_out <= {(ADC_BITS*SAMPLES){1'b0}};

		if (signal_from_wiznet5500 == 1'b1) begin
			fifo_full_count <= 9'd0;
			flag <= 1'b1;
		end  
	end else if (fifo_full == 1'b0 && sample_counter > 4) begin
		data_out <= data_send;
		fifo_write_enable <= 1'b1;
		sample_counter <= 1'b1;
		fifo_full_count = fifo_full_count + 1'b1;
   end
	end
end

endmodule


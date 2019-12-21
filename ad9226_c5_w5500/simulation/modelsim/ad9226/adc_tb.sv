`timescale 1ns/1ns
module adc_tb #(
        parameter ADC_BITS = 12,
	parameter SAMPLES = 20
    ) ();

reg clk_tb;
reg reset_n_tb;
reg fifo_full_tb;
reg [ADC_BITS-1:0] data_in_tb;

wire fifo_write_enable_tb;
wire [ADC_BITS*SAMPLES-1:0] data_out_tb;

ad9226_data #(ADC_BITS, SAMPLES) DUT
    (
        .sys_clk (clk_tb),
		.reset_n (reset_n_tb),
        .fifo_full (fifo_full_tb),
		.data_in (data_in_tb),
        .fifo_write_enable (fifo_write_enable_tb),
        .data_out (data_out_tb)
    );

initial begin
	reset_n_tb = 1'b0;
    clk_tb = 1'b0;
    fifo_full_tb = 1'b0;
	data_in_tb = 12'b0000_0000_0000;
	
    #200 reset_n_tb = 1'b1;
	#0   data_in_tb = 12'b1111_0000_1111;
	#20  data_in_tb = 12'b1001_0000_1001;
	#20  data_in_tb = 12'b0111_0000_0111;
	#20  data_in_tb = 12'b1110_0000_1110;
	
	#20  data_in_tb = 12'b0000_0000_0000;
	#20  data_in_tb = 12'b0000_1001_1001;
	#20  data_in_tb = 12'b0000_0111_0111;
	#20  data_in_tb = 12'b0000_1110_1110;
	
	#20  data_in_tb = 12'b0000_0000_0000;
	#20  data_in_tb = 12'b1001_0000_1001;
	#20  data_in_tb = 12'b0111_0000_0111;
	#20  data_in_tb = 12'b1110_0000_1110;
	
	#20  data_in_tb = 12'b0000_0000_0000;
	
    #5000 fifo_full_tb = 1'b1;
end

always begin
    #10 clk_tb = ~clk_tb;
end    

endmodule

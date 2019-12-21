`timescale 1ns/1ns

module wiznet5500_tb # (parameter LENGTH_UDP = 9'd245) ();

reg clk_in_tb;
reg eth_spi_miso_tb;
reg [11:0] data_a_in_tb;

wire eth_spi_mosi_tb;
wire eth_spi_ss_n_tb;
wire eth_spi_sck_tb;

wire aclk_tb;

//reset_n
reg key_1_tb;
wire eth_rst_tb;
wire led_tb;

w5500_fpga #(.LENGTH_UDP(LENGTH_UDP)) DUT (
	.clk (clk_in_tb),
	.data_a_in (data_a_in_tb),
	.aclk (aclk_tb),
    
	.eth_spi_mosi (eth_spi_mosi_tb),
	.eth_spi_miso (eth_spi_miso_tb),
	.eth_spi_ss_n (eth_spi_ss_n_tb),
	.eth_spi_sck  (eth_spi_sck_tb),
    
	.key_1 (key_1_tb),
	.eth_rst (eth_rst_tb),
	.led (led_tb)
    
);

initial begin
	clk_in_tb = 1'b0;
    eth_spi_miso_tb = 1'b0;
end

always begin
	#10 clk_in_tb = !clk_in_tb;
end

always begin
	#20 data_a_in_tb = 12'h111;
	#20 data_a_in_tb = 12'h222;
	#20 data_a_in_tb = 12'h333;
	#20 data_a_in_tb = 12'h444;
	#20 data_a_in_tb = 12'h555;
	#20 data_a_in_tb = 12'h666;
	#20 data_a_in_tb = 12'h777;
	#20 data_a_in_tb = 12'h888;
	#20 data_a_in_tb = 12'h999;
	#20 data_a_in_tb = 12'haaa;
	#20 data_a_in_tb = 12'hbbb;
	#20 data_a_in_tb = 12'hccc;
	#20 data_a_in_tb = 12'hddd;
	#20 data_a_in_tb = 12'heee;
	#20 data_a_in_tb = 12'hfff;
end

always begin
    #200 eth_spi_miso_tb <= 1'b0;
    #40  eth_spi_miso_tb <= 1'b0;
    #40  eth_spi_miso_tb <= 1'b1;
    #40  eth_spi_miso_tb <= 1'b0;
    #40  eth_spi_miso_tb <= 1'b0;
    #40  eth_spi_miso_tb <= 1'b0;
    #40  eth_spi_miso_tb <= 1'b1;
    #40  eth_spi_miso_tb <= 1'b0;
end

endmodule


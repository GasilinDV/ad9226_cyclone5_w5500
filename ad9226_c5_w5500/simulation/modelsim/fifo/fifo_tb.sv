`timescale 1ns/1ns
module fifo_tb #(
    parameter DATA_WIDTH = 48,
    parameter ADDRESS_WIDTH = 8,
    parameter MAX_ENTRIES = 255
) ();

reg clk_tb;
reg [DATA_WIDTH-1:0] data_in_tb;
reg write_enable_tb;
reg read_enabled_tb;

wire [DATA_WIDTH-1:0] data_out_tb;
wire fifo_empty_tb;
wire fifo_full_tb;
wire data_out_valid_tb;

fifo DUT (
    .clk (clk_tb),
    .data_in (data_in_tb),
    .data_out (data_out_tb),
    .write_enabled (write_enable_tb),
    .read_enabled (read_enabled_tb),
    .fifo_empty (fifo_empty_tb),
    .fifo_full (fifo_full_tb),
    .data_out_valid (data_out_valid_tb)
);

initial begin
    clk_tb = 1'b0;
    write_enable_tb = 1'b1;
    read_enabled_tb = 1'b0;
    #3000
    //write_enable_tb = 1'b0;
    read_enabled_tb = 1'b1;
    #1000
    write_enable_tb = 1'b0;
    #300
    read_enabled_tb = 1'b0;
end

initial begin
    #0   data_in_tb = 48'h123456789ABC;
    #120 data_in_tb = 48'h123456780000;
    #120 data_in_tb = 48'h123400009ABC;
    #120 data_in_tb = 48'h000056789ABC;
    #120 data_in_tb = 48'h000056780000;
    #120 data_in_tb = 48'h120056009A00;

end

always begin
    #10 clk_tb = ~clk_tb;
end


endmodule


module ad9226_data # (
		parameter ADC_BITS = 12,
		parameter SAMPLES = 20,	//меняем размер накапливаемых данных
		parameter FIFO_SIZE = 240
) (
		input								sys_clk, 
		input 								reset_n,
		input 								fifo_full,
		input			[ADC_BITS-1:0] 		data_in,
		
		output reg							fifo_write_enable,
		output reg 	[FIFO_SIZE-1:0] 	data_out
);

reg [FIFO_SIZE-1:0] data_send;
reg[SAMPLES - 1:0] sample_counter = {SAMPLES{1'b0}};

always @(posedge sys_clk) begin: SPI_OPERATION
    if (!reset_n) begin
		fifo_write_enable <= 1'b0;
		data_out <= {(FIFO_SIZE){1'b0}};
	end
	else begin
	fifo_write_enable <= 1'b0;
    data_out <= data_out;
	data_send <= {data_send[FIFO_SIZE-1-ADC_BITS:0], data_in};
	sample_counter = sample_counter + 1'b1;
	if (fifo_full == 1'b0 && sample_counter > SAMPLES) begin
        data_out <= data_send;
        fifo_write_enable <= 1'b1;
		sample_counter <= 1'b1;
	end
	end
end

endmodule


module adc_data_sync (
		input						sys_clk, 
		input 					reset_n,
		input			[11:0] 	data_in,
		output reg 	[11:0] 	data_out
);
	
logic [11:0] data_t;

always_ff @(negedge reset_n or posedge sys_clk)
begin
	if(!reset_n) begin
		data_t <= 12'd0;
	end
	else begin
		data_t <= data_in;
	end
end

always_ff @(negedge reset_n or posedge sys_clk)
begin
	if(!reset_n) begin
		data_out <= 12'd0;
	end
	else begin
		data_out <= data_t;
	end
end

endmodule

module ad9226_data # (
		parameter ADC_BITS = 12,
		parameter SAMPLES = 4	//меняем размер накапливаемых данных
) (
		input											sys_clk, 
		input 										reset_n,
		input 										fifo_full,
		input			[ADC_BITS-1:0] 			data_in,
		
		output reg									fifo_write_enable,
		output reg 	[ADC_BITS*SAMPLES-1:0] 	data_out
);

//reg [7:0] i;

reg [SAMPLES-1:0] 	sample_counter = {SAMPLES{1'b0}}; //занулим счетчик данных
reg [ADC_BITS-1:0] 	last_sample [SAMPLES-1:0]; // [11:0] last_sample [3:0]
reg[SAMPLES:0] 		clock_count = 5'b0;

always @(posedge sys_clk) begin: SPI_OPERATION
    if (!reset_n) begin
		fifo_write_enable <= 1'b0;
		data_out <= 48'd0;
		sample_counter <= 1'b0;
		clock_count <= 1'b0;
	end
	else begin
	fifo_write_enable <= 1'b0;
    data_out <= data_out;
    sample_counter <= 1'b0;
	clock_count <= 1'b0;
	
   		if (clock_count <= SAMPLES) begin
		clock_count <= clock_count + 1'b1;
		/*
			if(clock_count < 3) begin
				last_sample[sample_counter][ADC_BITS-1:0] <= data_in;
				sample_counter <= sample_counter + 1'b1;	
			end
		if (clock_count == 3 && fifo_full == 1'b0) begin
			data_out <= {
							last_sample[3][ADC_BITS-1:0], 
							last_sample[2][ADC_BITS-1:0], 
							last_sample[1][ADC_BITS-1:0], 
							last_sample[0][ADC_BITS-1:0]};
			fifo_write_enable <= 1'b1;
			sample_counter <= sample_counter + 1'b1;	
		end      
	*/
			case(clock_count)
			0, 1, 2, 3:
				begin
					//for (i = 0; i < SAMPLES; i = i + 1)
					//begin
						// Shift left one bit
						last_sample[sample_counter][ADC_BITS-1:0] <= data_in;
						sample_counter <= sample_counter + 1'b1;
					//end	
				end
			4:
				begin				
					//sample_counter <= sample_counter + 1'b1;
					if (fifo_full == 1'b0) begin
						data_out <= {//sample_counter,
										last_sample[3][ADC_BITS-1:0], 
										last_sample[2][ADC_BITS-1:0], 
										last_sample[1][ADC_BITS-1:0], 
										last_sample[0][ADC_BITS-1:0]};
						fifo_write_enable <= 1'b1;
					end                  
				end
			 default:
				begin

				end
			endcase
			
		end
	end
end

endmodule

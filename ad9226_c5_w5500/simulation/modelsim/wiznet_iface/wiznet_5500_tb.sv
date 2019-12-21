`timescale 1ns/1ns
module wiznet_5500_tb #(
    parameter DATA_READ_SIZE = 8
) ();

reg clk_tb;
reg miso_tb;
reg instruction_input_valid_tb;
reg [31:0] instruction_input_tb;
reg data_input_valid_tb;
reg [47:0] data_input_tb;

// Клиент должен запросить, чтобы модуль отправлял данные в свой буфер TX 
// достаточно часто, чтобы он не перезаписывал сам себя. Как правило, 
// это не должно быть проблемой, поскольку данные загружаются в буфер 
// медленнее, чем отправляются.
reg flush_requested_tb;

wire mosi_tb;
wire spi_clk_tb;
wire spi_chip_select_n_tb;

// Этот модуль предназначен для поддержки потоковой передачи данных по UDP. 
// Считывание данных предназначено для хранения ответов от последних 6 команд, 
// каждая из которых возвращает байт данных. Когда вы читаете регистры, 
// вам, скорее всего, понадобятся только результаты последнего чтения, 
// последних двух чтений или последних шести чтений. Некоторые данные имеют 
// ширину два байта и требуют двух чтений из регистра (например, адреса 
// указателя для буфера TX). MAC-адреса умещаются в шесть байтов.
wire [DATA_READ_SIZE-1:0] data_read_tb;

wire data_read_valid_tb;
wire is_available_tb;

wiznet5500 DUT (
    .clk (clk_tb),
    .miso (miso_tb),
    .instruction_input_valid (instruction_input_valid_tb),
    .instruction_input (instruction_input_tb),
    .data_input_valid (data_input_valid_tb),
    .data_input (data_input_tb),
    .flush_requested (flush_requested_tb),
    .mosi (mosi_tb),
    .spi_clk (spi_clk_tb),
    .spi_chip_select_n (spi_chip_select_n_tb),
    .data_read (data_read_tb),
    .data_read_valid (data_read_valid_tb),
    .is_available (is_available_tb)
);

initial begin
    clk_tb = 1'b0;
    data_input_valid_tb = 1'b1;
    #0   data_input_tb = 48'h123456789ABC;
    #120 data_input_tb = 48'h123456780000;
    #120 data_input_tb = 48'h123400009ABC;	 
    #120 data_input_tb = 48'h000056789ABC;
    #120 data_input_tb = 48'h000056780000;
    #120 data_input_tb = 48'h120056009A00;
end

always begin
	#40 miso_tb = 1'b0;
	#40 miso_tb = 1'b0;
	#40 miso_tb = 1'b1;
	#40 miso_tb = 1'b0;
	#40 miso_tb = 1'b0;
	#40 miso_tb = 1'b0;
	#40 miso_tb = 1'b1;
	#40 miso_tb = 1'b0;
end

always begin
	#640 flush_requested_tb = 1'b1;
	#20  flush_requested_tb = 1'b0;
end

always begin
    #10 clk_tb = ~clk_tb;
end



endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2020 10:17:23 AM
// Design Name: 
// Module Name: tb_RegFile
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_RegFile;
    reg tb_reset; 
    reg tb_clk; 
    reg tb_rg_wrt_en; 
    reg [4:0] tb_rg_wrt_addr,tb_rg_rd_addr1, tb_rg_rd_addr2;
    reg [31:0] tb_rg_wrt_data;
    wire [31:0] tb_rg_rd_data2, tb_rg_rd_data1;
    
    RegFile uut(
        .reset(tb_reset),
        .clk(tb_clk),
        .rg_wrt_en(tb_rg_wrt_en),
        .rg_wrt_addr(tb_rg_wrt_addr),
        .rg_rd_addr1(tb_rg_rd_addr1),
        .rg_rd_addr2(tb_rg_rd_addr2),
        .rg_wrt_data(tb_rg_wrt_data),
        .rg_rd_data1(tb_rg_rd_data1),
        .rg_rd_data2(tb_rg_rd_data2)  
   );
    
always #5 tb_clk = ~tb_clk;

initial begin
        tb_clk = 0; 
        tb_reset = 1;
        #100; 
        tb_reset = 0;
        #10;

        // test write enabled
        tb_rg_wrt_en = 1;
        tb_rg_wrt_addr = 8'h12;
        tb_rg_wrt_data = 12;
        #50; 

        // test write disabled
        tb_rg_wrt_en = 0;
        tb_rg_wrt_addr = 8'h00;
        tb_rg_wrt_data = 99;
        #50; 

        // test write enabled
        tb_rg_wrt_en = 1;
        tb_rg_wrt_addr = 8'h00;
        tb_rg_wrt_data = 99;
        #50;  
   end
endmodule
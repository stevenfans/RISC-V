`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 07:16:26 PM
// Design Name: 
// Module Name: RegFile
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


module RegFile(
    input clk,
    input reset,
    input rg_wrt_en,
    input  [4:0] rg_wrt_addr,
    input  [4:0] rg_rd_addr1,
    input  [4:0] rg_rd_addr2,
    input  [31:0] rg_wrt_data,
    output [31:0] rg_rd_data1,
    output [31:0] rg_rd_data2
    );
    
    reg [31:0] register [31:0];
    integer i; 
    
    // If Reset signal we should reset the register file 
    // (set all registers to 32'h00000000)
    always @(posedge reset, posedge clk)
    begin
        if (reset) begin 
            for(i=0; i<32; i=i+1)
                register[i] <= 32'b0;
        end else if(rg_wrt_en) begin 
            register[rg_wrt_addr] <= rg_wrt_data; 
        end
    end

    // output the data from the register
    assign rg_rd_data1 = register[rg_rd_addr1];
    assign rg_rd_data2 = register[rg_rd_addr2];
    
endmodule

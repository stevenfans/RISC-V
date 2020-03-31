`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 06:55:43 PM
// Design Name: 
// Module Name: tb_InstMem
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


module tb_InstMem;
    
    // inputs
    reg  [7:0] tb_addr;
    
    // outputs
    wire [31:0] tb_instruction;
    
    // UUT
    InstMem uut(
        .addr(tb_addr),
        .instruction(tb_instruction)
    ); 
    
    integer i; 
    
    initial begin
        for(i=0;i<=17;i=i+1) begin
            tb_addr = {i,2'b00}; 
            #10; // 10ns delay
        end 
    end
    
endmodule

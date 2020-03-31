`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 05:53:21 PM
// Design Name: 
// Module Name: tb_Instr_mem
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


module tb_Instr_mem;
    
    // inputs
    reg  [7:0] tb_addr;
    
    // outputs
    wire [31:0] tb_instruction;
    
    // UUT
    Instr_mem uut(
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

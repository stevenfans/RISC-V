`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2020 03:00:56 AM
// Design Name: 
// Module Name: ALUController
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


module ALUController(
    input  [1:0] ALUOp,
    input  [6:0] Funct7,
    input  [2:0] Funct3,
    output [3:0] Operation
    );
    
    // Define the input and output of singals
    
    // Define the ALU Controller modules behavior
    
    assign Operation[0] = 1'b1 ? ((Funct3==3'b110) | ((Funct3==3'b010) & (ALUOp[0]==1'b0))) : 1'b0;
    assign Operation[1] = 1'b1 ? ((Funct3==3'b000) | ((Funct3==3'b010) && ((ALUOp[0]==1'b1)|(ALUOp[1]==1'b1)))):1'b0; 
    assign Operation[2] = 1'b1 ? ((Funct3==3'b100) | ())
endmodule

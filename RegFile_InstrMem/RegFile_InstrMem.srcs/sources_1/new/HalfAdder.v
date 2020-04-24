`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2020 03:32:07 PM
// Design Name: 
// Module Name: HalfAdder
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


module HalfAdder(
    input [7:0] A,
    input [7:0] B,
    output [7:0] Sum,
    output Cout
    );

    // use the Half-Adder circuit
//    xor(Sum[7:0],A[7:0],B[7:0]);
//    and(Cout,A,B);
    assign Sum = A ^ B; 
    assign Cout = A & B; 

endmodule

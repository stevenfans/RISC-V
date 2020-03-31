`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  CSULB
// Engineer: Steven Phan
// 
// Create Date: 03/30/2020 07:10:53 PM
// Design Name: 
// Module Name: MUX21
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


module MUX21(
    input [31:0] D1,
    input [31:0] D2,
    input S,
    output [31:0] Y
    );
    
    assign Y = S ? D1:D2;  
endmodule

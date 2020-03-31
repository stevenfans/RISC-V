`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 02:20:10 PM
// Design Name: 
// Module Name: FlipFlop
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


module FlipFlop(
    input clk,
    input reset,
    input [7:0] d,
    output reg [7:0] q
    );
    
    always @(posedge reset, posedge clk)
    begin
        if (reset) begin
            q <= 8'h00; 
        end else begin
            q <= d; 
        end
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 06:50:28 PM
// Design Name: 
// Module Name: ImmGen
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


module ImmGen(
    input [31:0] InstCode,
    output reg [31:0] ImmOut
    );
    
    always @(InstCode) begin
        case(InstCode[6:0])
            7'b0000011: ImmOut = {InstCode[31] ? {20{1'b1}}:20'b0, InstCode[31:20]};
            7'b0010011: ImmOut = {InstCode[31] ? {20{1'b1}}:20'b0, InstCode[31:20]};
            7'b0100011: ImmOut = {InstCode[31] ? {20{1'b1}}:20'b0, InstCode[31:25], InstCode[11:7]};
            7'b0001011: ImmOut = {InstCode[31:12], 12'b0};
            default: ImmOut = {32'b0};
        endcase
    end
endmodule

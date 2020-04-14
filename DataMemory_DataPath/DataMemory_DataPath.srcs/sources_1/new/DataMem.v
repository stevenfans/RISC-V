`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 08:44:13 PM
// Design Name: 
// Module Name: DataMem
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


module DataMem(
    input MemRead,
    input MemWrite,
    input [31:0] addr,
    input [31:0] write_data,
    output [31:0] read_data
    );

    integer i;

    reg [31:0] memory [127:0]; //128 data each 32 bits

    // need to populate the memory at ts:0
    initial begin
        for(i=0; i<128; i=i+1) begin
            memory[i] = 32'h00; 
        end
    end


    always @ (MemRead, MemRead) begin
        if (MemWrite)begin
            memory[addr] = write_data; 
        end
        if (MemRead) begin
            read_data = memory[addr];
        end
    end



endmodule

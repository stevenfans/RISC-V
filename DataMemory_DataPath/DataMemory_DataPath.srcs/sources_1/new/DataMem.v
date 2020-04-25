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
    input [8:0] addr,
    input [31:0] write_data,
    output reg [31:0] read_data
    );

    integer i;

    reg [31:0] memory [127:0]; //128 data each 32 bits

    // need to populate the memory at ts:0
    initial begin
        for(i=0; i<128; i=i+1) begin
            memory[i] <= 0; 
        end
    end

    // Byte addressable memory
    // 32 bits is 4 bytes
    // so 128 x 4 = 512
    // example. addr = 1 ** 2 = byte 1 is @ 128/
    //          addr = 10 ** 2 = byte 100
    // to determine which reg to write to div by 4 and floor
    // ex. byte 10 so floor(10/4) = 3
    // to determine the which  x mod (floor(x/4)*4) then shift times 2
    // reference image http://i.stack.imgur.com/rpB7N.png

    always @ (MemWrite,MemRead) begin
        if (MemWrite) begin
//                memory[1][1] = 8'hAA; 
//             memory[(addr/4)][(addr%(addr/4)*4)] <= 8'hAA; //write_data[1:0]; 
            memory[addr] <=write_data;
        end
        else if (MemRead) begin
            // read_data <= memory[(addr/4)][(addr%(addr/4)*4)];
            read_data<=memory[addr];
        end
    end

endmodule

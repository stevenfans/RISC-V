`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 06:51:42 PM
// Design Name: 
// Module Name: InstMem
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


module InstMem(
    input [7:0] addr,
    output wire [31:0] instruction
    );
    // create 64x32 memory
    reg [31:0] memory [63:0]; 
    
    initial begin 
        memory[0] = 32'h00007033; // and r0, r0, r032'h00000000
        memory[1] = 32'h00100093; // addi r1, r0, 132'h00000001
        memory[2] = 32'h00200113; // addi r2, r0, 232'h00000002
        memory[3] = 32'h00308193; // addi r3, r1, 332'h00000004
        memory[4] = 32'h00408213; // addi r4, r1, 432'h00000005
        memory[5] = 32'h00510293; // addi r5, r2, 532'h00000007
        memory[6] = 32'h00610313; // addi r6, r2, 632'h00000008
        memory[7] = 32'h00718393; // addi r7, r3, 732'h0000000B
        memory[8] = 32'h00208433; // add r8, r1, r232'h00000003
        memory[9] = 32'h404404b3; // sub r9, r8, r432'hfffffffe
        memory[10] = 32'h00317533;// and r10, r2, r332'h00000000
        memory[11] = 32'h0041e5b3;// or r11, r3, r432'h00000005
        memory[12] = 32'h0041a633;// if r3 is less than r4 then r12 = 132'h00000001
        memory[13] = 32'h007346b3;// nor r13, r6, r732'hfffffff4
        memory[14] = 32'h4d34f713;// andi r14, r9, "4D3"32'h000004D2
        memory[15] = 32'h8d35e793;// ori r15, r11, "8d3"32'hfffff8d7
        memory[16] = 32'h4d26a813;// if r13 is less than 32'h000004D2 then r16 = 132'h00000001
        memory[17] = 32'h4d244893;// nori r17, r8, "4D2"32'hfffffb2C    
    end 
    
    assign instruction = memory[addr[7:2]];

endmodule


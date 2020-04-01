`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2020 05:00:40 PM
// Design Name: 
// Module Name: DataPath
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


module DataPath(
    input reset,
    input clk,
    input RegWrite,
    input ALUSrc,
    input MemWrite,
    input MemtoReg,
    input ALUCC,
    input MemRead,
    output [6:0] opcode,
    output [0:0] Funct3,
    output [6:0] Funct7,
    output [8:0] Datapath_Result
    );

    // wires 
    wire [7:0]  PCPlus4; 
    wire [31:0] Instruction;
    
    // reg
    reg [7:0] PC;
    reg d1;

    FlipFLop dflop(
            .clk(clk),
            .reset(reset),
            .d(PCPlus4),
            .q(PC)
        );

    InstMem inst_mem(
        .addr(pC),
        .instruction(Instruction)
    );

    //TODO NEED TO ADD A HALF-ADDER MODULE
    
    ImmGen imm_gen(
        .InstCode(Instruction),
        .ImmOut(d1)
    ); 



    

endmodule 
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2020 02:56:27 PM
// Design Name: 
// Module Name: processor
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


module processor(
    input clk,
    input reset,
    output [31:0] Result
    );

    // Define the input and output signals
    wire [6:0]  opcode;
    wire [2:0]  funct3;
    wire [6:0]  funct7; 
    wire [1:0]  aluop;
    wire [3:0]  operation;
    wire        memtoreg; 
    wire        memwrite; 
    wire        memread; 
    wire        alusrc;
    wire        regwrite; 


    // Define the processor modules behavior

    Controller controller(
            .Opcode(opcode),
            .ALUOp(aluop),
            .ALUSrc(alusrc),
            .MemtoReg(memtoreg),
            .RegWrite(regwrite),
            .MemRead(memread),
            .MemWrite(memwrite)
        ); 

    ALUController alucontroller(
            .ALUOp(aluop),
            .Funct7(funct7),
            .Funct3(funct3),
            .Operation(operation)
        );

    DataPath datapath(
            .reset(reset),
            .clk(clk),
            .reg_write(regwrite),
            .alu_src(alusrc),
            .mem_write(memwrite),
            .mem2reg(memtoreg),
            .alu_cc(operation),
            .mem_read(memread),
            .opcode(opcode),
            .funct3(funct3),
            .funct7(funct7),
            .alu_result(Result)
        );

endmodule

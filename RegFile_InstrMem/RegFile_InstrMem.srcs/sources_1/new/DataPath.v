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
    input [3:0]ALUCC,
    input MemRead,
    output [6:0] opcode,
    output [2:0] Funct3,
    output [6:0] Funct7,
    output [31:0] Datapath_Result
    );

    //parameters
    parameter PC_W = 8; 
    parameter INS_W = 32;
    parameter RF_ADDRESS =5;
    parameter DATA_W = 32; 
    parameter DM_ADDRESS = 9; 
    parameter ALU_CC_W = 4;

    // wires 
    wire [7:0]  PCPlus4; 
    wire [31:0] Instruction, Reg1, Reg2, WriteBack_Data, SrcB;
    wire [8:0]  ALU_Result;
    
    // reg
    reg [7:0] PC;
    reg ExtImm;
    reg [31:0] DataMem_read;

    FlipFlop dflop(
            .clk(clk),
            .reset(reset),
            .d(PCPlus4),
            .q(PC)
        );

    InstMem inst_mem(
        .addr(pC),
        .instruction(Instruction)
    );

    HalfAdder ha(
            .A(PC),
            .B(8'h04),
            .Sum(PCPlus4)
        );

    ImmGen imm_gen(
            .InstCode(Instruction),
            .ImmOut(d1)
        ); 

    RegFile reg_file(
            .clk(clk),
            .reset(reset),
            .rg_wrt_en(RegWrite),
            .rg_wrt_addr(Instruction[11:7]),
            .rg_rd_addr1(Instruction[19:15]),
            .rg_rd_addr2(Instruction[24:20]),
            .rg_wrt_data(WriteBack_Data),
            .rg_rd_data1(Reg1),
            .rg_rd_data(Reg2)
        );

    MUX21 alu_mux(
            .D1(Reg2),
            .D2(ExtImm),
            .S(ALUSrc),
            .Y(SrcB)
        );

    alu_32 alu(
            .A_in(Reg1),
            .B_in(SrcB),
            .ALU_Sel(ALUCC),
            .ALU_Result(ALU_Result),
            .Carry_Out(),
            .Zero(),
            .Overflow()
        );

    DataMem data_mem(
            .MemRead(MemRead),
            .MemWrite(MemWrite),
            .addr(ALU_Result),
            .write_data(Reg2),
            .read_data(DataMem_read)
        );
    

endmodule 
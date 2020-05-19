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
    input reg_write,
    input alu_src,
    input mem_write,
    input mem2reg,
    input [3:0] alu_cc,
    input mem_read,
    output [6:0] opcode,
    output [2:0] funct3,
    output [6:0] funct7,
    output [31:0] alu_result // Datapath_Result 
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
    wire [31:0]  ALU_Result;
    
    // reg
    wire [7:0] PC;
    wire [31:0] ExtImm;
    wire [31:0] DataMem_read;

    FlipFlop dflop(
            .clk(clk),
            .reset(reset),
            .d(PCPlus4),
            .q(PC)
        );

    Instr_mem inst_mem(
        .addr(PC),
        .instruction(Instruction)
    );

    HalfAdder ha(
            .A(PC),
            .B(8'h04),
            .Sum(PCPlus4),
            .Cout()
        );

    ImmGen imm_gen(
            .InstCode(Instruction),
            .ImmOut(ExtImm)
        ); 

    RegFile reg_file(
            .clk(clk),
            .reset(reset),
            .rg_wrt_en(reg_write),
            .rg_wrt_addr(Instruction[11:7]),
            .rg_rd_addr1(Instruction[19:15]),
            .rg_rd_addr2(Instruction[24:20]),
            .rg_wrt_data(WriteBack_Data),
            .rg_rd_data1(Reg1),
            .rg_rd_data2(Reg2)
        );

    MUX21 alu_mux(
            .D1(Reg2),
            .D2(ExtImm),
            .S(alu_src),
            .Y(SrcB)
        );

    alu_32 alu(
            .A_in(Reg1),
            .B_in(SrcB),
            .ALU_Sel(alu_cc),
            .ALU_Out(ALU_Result),
            .Carry_Out(),
            .Zero(),
            .Overflow()
        );

    DataMem data_mem(
            .MemRead(mem_read),
            .MemWrite(mem_write),
            .addr(ALU_Result[8:0]),
            .write_data(Reg2),
            .read_data(DataMem_read)
        );
        
    MUX21 data_mem_mux(
            .D1(ALU_Result),
            .D2(DataMem_read),
            .S(mem2reg),
            .Y(WriteBack_Data)  
        );
    
    assign opcode = Instruction[6:0]; 
    assign funct3 = Instruction[14:12]; 
    assign funct7 = Instruction[31:25]; 
    assign alu_result = ALU_Result;    
endmodule 
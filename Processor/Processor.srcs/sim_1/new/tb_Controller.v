`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2020 04:29:20 PM
// Design Name: 
// Module Name: tb_Controller
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


module tb_Controller;

    // inputs
    reg [6:0] tb_Opcode;
    
    // outputs
    wire tb_ALUSrc;
    wire tb_MemtoReg; 
    wire tb_RegWrite; 
    wire tb_MemRead;
    wire tb_MemWrite; 
    wire [1:0] tb_ALUOp; 

    // instantiate the DUT
    Controller DUT (
        .Opcode(tb_Opcode),
        .ALUSrc(tb_ALUSrc),
        .MemtoReg(tb_MemtoReg),
        .RegWrite(tb_RegWrite),
        .MemRead(tb_MemRead),
        .MemWrite(tb_MemWrite),
        .ALUOp(tb_ALUOp)
    );
    
    initial begin
        // Test: AND,OR,ADD,SUB,SLT,NOR
        tb_Opcode = 7'b0110011;
        #100; 

        // Test: ANDI,ORI,ADDI,SLTI,NORI
        tb_Opcode = 7'b0010011;
        #100; 
        
        // Test: LW
        tb_Opcode = 7'b0000011;
        #100; 
        
        // Test: SW
        tb_Opcode = 7'b0100011;
        #100; 
        
    end
endmodule

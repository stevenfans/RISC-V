`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2020 11:42:45 PM
// Design Name: 
// Module Name: tb_ALUController
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


module tb_ALUController;

    // inputs
    reg [1:0] tb_ALUOp; 
    reg [6:0] tb_Funct7; 
    reg [2:0] tb_Funct3; 
    
    // outputs
    wire [3:0] tb_Operation

    // insantiate the DUT
    ALUController DUT(
            .ALUOp(tb_ALUOp),
            .Funct7(tb_Funct7),
            .Funct3(tb_Funct3),
            .Operation(tb_Operation)
    ); 

    initial begin
        
        // AND
        tb_Funct7 = 7'b0000000;
        tb_Funct3 = 3'b111; 
        ALUOp = 2'b10; 
        #100; 

        // OR
        tb_Funct7 = 7'b0000000;
        tb_Funct3 = 3'b110; 
        ALUOp = 2'b10; 
        #100; 

        // NOR
        tb_Funct7 = 7'b0000000;
        tb_Funct3 = 3'b100; 
        ALUOp = 2'b10; 
        #100; 

        // SLT
        tb_Funct7 = 7'b0000000;
        tb_Funct3 = 3'b010; 
        ALUOp = 2'b10; 
        #100; 

        // ADD
        tb_Funct7 = 7'b0000000;
        tb_Funct3 = 3'b000; 
        ALUOp = 2'b10; 
        #100; 

        // SUB
        tb_Funct7 = 7'b0100000;
        tb_Funct3 = 3'b000; 
        ALUOp = 2'b10; 
        #100; 

        // ANDI
        tb_Funct7 = 7'b0000000;
        tb_Funct3 = 3'b111; 
        ALUOp = 2'b00; 
        #100; 

        // ORI
        tb_Funct7 = 7'b0000000;
        tb_Funct3 = 3'b110; 
        ALUOp = 2'b00; 
        #100; 

        // NORI
        tb_Funct7 = 7'b0000000;
        tb_Funct3 = 3'b100; 
        ALUOp = 2'b00; 
        #100; 

        // SLTI
        tb_Funct7 = 7'b0000000;
        tb_Funct3 = 3'b111; 
        ALUOp = 2'b10; 
        #100; 
    end
endmodule

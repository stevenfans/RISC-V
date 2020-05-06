`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2020 04:15:44 PM
// Design Name: 
// Module Name: Controller
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


module Controller(
    input [6:0] Opcode,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg [1:0] ALUOp
    );

    always @ (Opcode) begin 
        case(Opcode)
            7'b0110011: begin   //AND,OR,ADD,SUB,SLT,NOR 
                            MemtoReg  = 0;
                            MemWrite   = 0; 
                            MemRead    = 0;
                            ALUSrc     = 0; 
                            RegWrite   = 0; 
                            ALUOp      = 2'b10; 
                        end
            7'b0010011: begin   //ANDI,ORI,ADDI,SLTI,NORI
                            MemtoReg = 0;
                            MemWrite   = 0; 
                            MemRead    = 0;
                            ALUSrc     = 1; 
                            RegWrite   = 1; 
                            ALUOp      = 2'b00; 
                        end
            7'b0000011: begin   //LW
                            MemtoReg   = 1;
                            MemWrite   = 0; 
                            MemRead    = 1;
                            ALUSrc     = 1; 
                            RegWrite   = 1; 
                            ALUOp      = 2'b01; 
                        end
            7'b0100011: begin   //SW 
                            MemtoReg  = 0;
                            MemWrite   = 1; 
                            MemRead    = 0;
                            ALUSrc     = 1; 
                            RegWrite   = 0; 
                            ALUOp      = 2'b01; 
                        end
            default: begin   //if anything else make everything a 0
                            MemtoReg  = 0;
                            MemWrite   = 0; 
                            MemRead    = 0;
                            ALUSrc     = 0; 
                            RegWrite   = 0; 
                            ALUOp      = 2'b00; 
                        end
        endcase
    end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2020 11:13:41 AM
// Design Name: 
// Module Name: tb_ALU
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


module tb_ALU;
    
    // inputs
    reg 	[31:0] tb_din_a, tb_din_b;
	reg 	[ 3:0]  tb_alu_sel;
	//outputs
	wire 	[31:0] ALU_Out;
	wire 		   Overflow, Zero, Carry_Out;
	
	// UUT
    ALU uut(
        .A_in(tb_din_a), 
        .B_in(tb_din_b),
        .ALU_Sel(tb_alu_sel),
        .ALU_Out(ALU_Out),
        .Overflow(Overflow),
        .Zero(Zero),
        .Carry_Out(Carry_Out)
        );
        
    initial
    begin 
    
    // AND case
    #20 //20ns delay
    tb_din_a=32'h086a0c31; tb_din_b=32'hd785f148; tb_alu_sel=4'b0000;//Ans: 0000 0000
    
    // OR case
    #20 //20ns delay
    tb_din_a=32'h086a0c31; tb_din_b=32'h10073fd4; tb_alu_sel=4'b0001;//Ans: 186F 3FF5
    
    // ADD case
    #20 //20ns delay
    tb_din_a=32'h086A0C31; tb_din_b=32'h90073FD4; tb_alu_sel=4'b0010; //Ans: 9871 4C05?
    
    // SUBTRACT case
    #20 //20ns delay
    tb_din_a=32'h086A0C31; tb_din_b=32'h90073FD4; tb_alu_sel=4'b0110; //Ans: FFFF FFFF 7862 CC5D?
    
    // SET LESS THAN case
    #20 //20ns delay
    tb_din_a=32'h086A0C31; tb_din_b=32'h90073FD4; tb_alu_sel=4'b0111; //Ans: 1
    
    // NOR case
    #20 //20ns delay
    tb_din_a=32'h086A0C31; tb_din_b=32'h90073FD4; tb_alu_sel=4'b1100;//Ans: FFFF FFFF 6790 C00A
  
    // EQUAL COMPARISON case
    #20 //20ns delay
    tb_din_a=32'h086A0C31; tb_din_b=32'h086A0C31; tb_alu_sel=4'b1111; //Ans: 1
    
    // EQUAL COMPARISON case
    #20 //20ns delay
    tb_din_a=32'h086A0C31; tb_din_b=32'h10073fd4; tb_alu_sel=4'b1111; //Ans: 0
     
    end
endmodule
















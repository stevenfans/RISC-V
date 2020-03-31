`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 04:42:15 PM
// Design Name: 
// Module Name: tb_FlipFlop
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


module tb_FlipFlop;

   // inputs
   reg tb_reset;
   reg tb_clk;
   reg [7:0] tb_d;
   
   // outputs
   wire [7:0] tb_q;
   
   //UUT
   FlipFlop uut(
        .reset(tb_reset),
        .clk(tb_clk),
        .d(tb_d),
        .q(tb_q)   
   );
   
   always #5 tb_clk = ~tb_clk; 
   
   initial begin
        
        tb_clk = 0; 
        tb_reset = 1;
        tb_d = 9; 
        #20 //20 ns delay
        
        tb_reset = 0;
        
        
        
   end

endmodule

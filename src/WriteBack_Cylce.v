`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2026 15:41:28
// Design Name: 
// Module Name: WriteBack_Cylce
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

module WriteBack_Cylce(clk,rst,RegWriteW,ResultSrcW,ALUResultW,ReadDataW,RdW,PCPlus4W,ResultW);

input clk,rst,RegWriteW;
input [1:0]ResultSrcW;
input [31:0]ALUResultW,ReadDataW,PCPlus4W;
input [4:0]RdW;

output [31:0]ResultW;

mux2 mux2_(.a(ALUResultW),
          .b(ReadDataW),
          .c(PCPlus4W),
          .s(ResultSrcW),
          .result(ResultW));


endmodule


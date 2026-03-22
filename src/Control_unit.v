`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2026 11:21:37
// Design Name: 
// Module Name: Control_unit
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

`include "Main_Decoder.v"
`include "ALU_Decoder.v"

module Control_unit(Op,RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Jump,Branch,funct3,funct7,ALUControl);

input [6:0] Op,funct7;
input [2:0]funct3;
output RegWrite,ALUSrc,MemWrite,ResultSrc,Jump,Branch;
output [1:0]ImmSrc;
output [2:0]ALUControl;

wire [1:0]ALUOp;

Main_Decoder Main_Decoder(.Op(Op),
                          .RegWrite(RegWrite),
                          .ImmSrc(ImmSrc),
                          .ALUSrc(ALUSrc),
                          .MemWrite(MemWrite),
                          .ResultSrc(ResultSrc),
                          .Jump(Jump),
                          .Branch(Branch),
                          .ALUOp(ALUOp));
                          
ALU_Decoder ALU_Decoder(.Op(Op),
                        .funct3(funct3),
                        .funct7(funct7),
                        .ALUOp(ALUOp),
                        .ALUControl(ALUControl));
                        
                                                  
endmodule

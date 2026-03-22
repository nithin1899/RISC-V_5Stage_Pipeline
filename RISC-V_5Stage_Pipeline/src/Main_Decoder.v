`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2026 00:44:01
// Design Name: 
// Module Name: Main_Decoder
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


module Main_Decoder(Op,RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Jump,Branch,ALUOp);

input [6:0]Op;
output RegWrite,ALUSrc,MemWrite,ResultSrc,Jump,Branch;
output [1:0]ImmSrc,ALUOp;
reg controls;

assign RegWrite=(Op==7'b0000011 | Op==7'b0110011)? 1'b1:1'b0;
assign ImmSrc=(Op==7'b0100011)?2'b01:
              (Op==7'b1100011)?2'b10:2'b00;
assign ALUSrc=(Op==7'b0000011 | Op==7'b0100011)?1:0;
assign MemWrite=(Op==7'b0100011)?1'b1:1'b0;
assign ResultSrc=(Op==7'b0000011)?1'b1:1'b0;
assign Branch=(Op==7'b1100011)?1'b1:1'b0;
assign ALUOp=(Op==7'b0110011)?2'b10:
             (Op==7'b1100011)?2'b01:2'b00;
assign Jump=1'b0;             
             
//always @(*) begin
//    casez (Op)
   
//        7'b0000011: controls = 12'b1_00_1_0_01_00_0_0_0; // lw
//        7'b0100011: controls = 12'b0_01_1_1_00_00_0_0_0; // sw
//        7'b0110011: controls = 12'b1_xx_0_0_00_10_0_0_0; // R-type
//        7'b1100011: controls = 12'b0_10_0_0_00_01_0_0_1; // branch
//        7'b0010011: controls = 12'b1_00_1_0_00_10_0_0_0; // I-type ALU
//        7'b1101111: controls = 12'b1_11_0_0_10_00_1_0_0; // jal
//        7'b1100111: controls = 12'b1_00_1_0_10_00_0_1_0; // jalr
//        7'b0x10111: controls = 12'b1_xx_x_0_11_xx_0_0_0; // lui or auipc
//        default:    controls = 12'h000;                   // undefined
//    endcase
        
//end             
               
//assign {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,ALUOp,Jump,Jalr,Branch} = controls;
               
endmodule

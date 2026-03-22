`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2026 17:21:08
// Design Name: 
// Module Name: Decode_Cylce
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

module Decode_Cylce(clk,rst,RegWriteW,InstrD,PCD,PCPlus4D,RDW,ResultW,RegWriteE,ResultSrcE,MemWriteE,JumpE,BranchE,ALUControlE,ALUSrcE,RD1E,RD2E,PCE,RdE,Rs1E,Rs2E,ImmExtE,PCPlus4E);

input clk,rst,RegWriteW;
input [31:0] InstrD,PCD,PCPlus4D,RDW,ResultW;

output RegWriteE,MemWriteE,JumpE,BranchE,ALUSrcE;
output [1:0] ResultSrcE;
output [2:0] ALUControlE;
output [31:0] RD1E,RD2E,PCE,ImmExtE,PCPlus4E;
output [4:0] RdE,Rs1E,Rs2E;

wire RegWriteD,MemWriteD,JumpD,BranchD,ALUSrcD;
wire [1:0] ResultSrcD,ImmSrcD;
wire [2:0] ALUControlD;
wire [4:0]RdD=InstrD[11:7];
wire [31:0]RD1D,RD2D,ImmExtD;


reg RegWriteD_reg,MemWriteD_reg,JumpD_reg,BranchD_reg,ALUSrcD_reg;
reg [1:0] ResultSrcD_reg;
reg [2:0] ALUControlD_reg;
reg [4:0]RdD_reg,Rs1D_reg,Rs2D_reg;
reg [31:0]RD1D_reg,RD2D_reg,ImmExtD_reg,PCD_reg,PCPlus4D_reg;

Control_unit control_unit(.Op(InstrD[6:0]),
                          .RegWrite(RegWriteD),
                          .ImmSrc(ImmSrcD),
                          .ALUSrc(ALUSrcD),
                          .MemWrite(MemWriteD),
                          .ResultSrc(ResultSrcD),
                          .Jump(JumpD),
                          .Branch(BranchD),
                          .funct3(InstrD[14:12]),
                          .funct7(InstrD[31:25]),
                          .ALUControl(ALUControlD));
                          
Register_File register_File(.clk(clk),
                            .rst(rst),
                            .A1(InstrD[19:15]),
                            .A2(InstrD[24:20]),
                            .A3(RDW),
                            .WE3(RegWriteW),
                            .WD3(ResultW),
                            .RD1(RD1D),
                            .RD2(RD2D));                          

Extend_Block extend_Block(.In(InstrD[31:0]),
                          .Imm_Ext(ImmExtD),
                          .ImmSrc(ImmSrcD));
                          
always @( posedge clk or negedge rst ) begin 

if(rst==1'b0)begin

RegWriteD_reg<=1'b0;
ResultSrcD_reg<=2'b00;
MemWriteD_reg<=1'b0;
JumpD_reg<=1'b0;
BranchD_reg<=1'b0;
ALUControlD_reg<=3'b000;
ALUSrcD_reg<=1'b0;
RD1D_reg<=32'd0;
RD2D_reg<=32'd0;
PCD_reg<=32'd0;
RdD_reg<=5'd0;
ImmExtD_reg<=32'd0;
PCPlus4D_reg<=32'd0;
Rs1D_reg <= 5'd0;
Rs2D_reg <= 5'd0;

end

else begin
 
RegWriteD_reg<=RegWriteD;
ResultSrcD_reg<=ResultSrcD;
MemWriteD_reg<=MemWriteD;
JumpD_reg<=JumpD;
BranchD_reg<=BranchD;
ALUControlD_reg<=ALUControlD;
ALUSrcD_reg<=ALUSrcD;
RD1D_reg<=RD1D;
RD2D_reg<=RD2D;
PCD_reg<=PCD;
RdD_reg<=RdD;
ImmExtD_reg<=ImmExtD;
PCPlus4D_reg<=PCPlus4D;
Rs1D_reg <= InstrD[19:15];
Rs2D_reg <= InstrD[24:20];

end

end

assign RegWriteE = RegWriteD_reg;
    assign ALUSrcE = ALUSrcD_reg;
    assign MemWriteE = MemWriteD_reg;
    assign ResultSrcE = ResultSrcD_reg;
    assign BranchE = BranchD_reg;
    assign ALUControlE = ALUControlD_reg;
    assign RD1E = RD1D_reg;
    assign RD2E = RD2D_reg;
    assign ImmExtE = ImmExtD_reg;
    assign RdE = RdD_reg;
    assign PCE = PCD_reg;
    assign PCPlus4E = PCPlus4D_reg;
    assign Rs1E = Rs1D_reg;
    assign Rs2E = Rs2D_reg;                      


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2026 16:19:53
// Design Name: 
// Module Name: Pipeline_Datapath
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
module Pipeline_Datapath(clk,rst);


input clk,rst;

wire PCSrcE,RegWriteW,RegWriteE,MemWriteE,JumpE,BranchE,ALUSrcE,RegWriteM,MemWriteM;
wire [1:0]ResultSrcE,ResultSrcM,ResultSrcW;
wire [2:0]ALUControlE,ForwardAE,ForwardBE;
wire [4:0]RdD,RdE,Rs1E,Rs2E,RdM,RdW;

wire [31:0] ResultW,RD1E,RD2E,PCE,ImmExtE,PCPlus4E;
wire [31:0]InstrD,PCD,PCPlus4D,PCTargetE;
wire [31:0]ALUResultM,WriteDataM,RdM,PCPlus4M;
wire [31:0]ALUResultW,ReadDataW,PCPlus4W;



Fetch_Cycle fetch_Cycle(.clk(clk),
                   .rst(rst),
                   .PCSrcE(PCSrcE),
                   .InstrD(InstrD),
                   .PCD(PCD),
                   .PCPlus4D(PCPlus4D),
                   .PCTargetE(PCTargetE));

Decode_Cylce decode_Cylce(.clk(clk),
                          .rst(rst),
                          .RegWriteW(RegWriteW),
                          .InstrD(InstrD),
                          .PCD(PCD),
                          .PCPlus4D(PCPlus4D),
                          .RDW(RdW),
                          .ResultW(ResultW),
                          .RegWriteE(RegWriteE),
                          .ResultSrcE(ResultSrcE),
                          .MemWriteE(MemWriteE),
                          .JumpE(JumpE),
                          .BranchE(BranchE),
                          .ALUControlE(ALUControlE),
                          .ALUSrcE(ALUSrcE),
                          .RD1E(RD1E),
                          .RD2E(RD2E),
                          .PCE(PCE),
                          .RdE(RdE),
                          .Rs1E(Rs1E),
                          .Rs2E(Rs2E),
                          .ImmExtE(ImmExtE),
                          .PCPlus4E(PCPlus4E));

Execute_Cycle execute_Cycle(.clk(clk),
                            .rst(rst),
                            .RegWriteE(RegWriteE),
                            .ResultSrcE(ResultSrcE),
                            .MemWriteE(MemWriteE),
                            .JumpE(JumpE),
                            .BranchE(BranchE),
                            .ALUControlE(ALUControlE),
                            .ALUSrcE(ALUSrcE),
                            .RD1E(RD1E),
                            .RD2E(RD2E),
                            .PCE(PCE),
                            .RdE(RdE),
                            .Rs1E(Rs1E),
                            .Rs2E(Rs2E),
                            .ImmExtE(ImmExtE),
                            .PCPlus4E(PCPlus4E),
                            .PCSrcE(PCSrcE),
                            .RegWriteM(RegWriteM),
                            .ResultSrcM(ResultSrcM),
                            .MemWriteM(MemWriteM),
                            .ALUResultM(ALUResultM),
                            .WriteDataM(WriteDataM),
                            .RdM(RdM),
                            .PCPlus4M(PCPlus4M),
                            .PCTargetE(PCTargetE),
                            .ResultW_E(ResultW),
                            .ForwardAE(ForwardAE),
                            .ForwardBE(ForwardBE),
                            .ALUResultM_prev(ALUResultM));

Memory_Cylce memory_Cylce(.clk(clk),
                          .rst(rst),
                          .RegWriteM(RegWriteM),
                          .ResultSrcM(ResultSrcM),
                          .MemWriteM(MemWriteM),
                          .ALUResultM(ALUResultM),
                          .WriteDataM(WriteDataM),
                          .RdM(RdM),
                          .PCPlus4M(PCPlus4M),
                          .RegWriteW(RegWriteW),
                          .ResultSrcW(ResultSrcW),
                          .ALUResultW(ALUResultW),
                          .ReadDataW(ReadDataW),
                          .RdW(RdW),
                          .PCPlus4W(PCPlus4W));

WriteBack_Cylce writeBack_Cylce(.clk(clk),
                                .rst(rst),
                                .RegWriteW(RegWriteW),
                                .ResultSrcW(ResultSrcW),
                                .ALUResultW(ALUResultW),
                                .ReadDataW(ReadDataW),
                                .RdW(RdW),
                                .PCPlus4W(PCPlus4W),
                                .ResultW(ResultW));




Hazard_Unit hazard_unit(.rst(rst),
                        .RegWriteM(RegWriteM),
                        .RegWriteW(RegWriteW),
                        .RdM(RdM),
                        .RdW(RdW),
                        .Rs1E(Rs1E),
                        .Rs2E(Rs2E),
                        .ForwardAE(ForwardAE),
                        .ForwardBE(ForwardBE));
                        
endmodule                        

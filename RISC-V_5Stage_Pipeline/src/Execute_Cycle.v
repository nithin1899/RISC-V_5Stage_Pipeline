`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2026 12:25:06
// Design Name: 
// Module Name: Execute_Cycle
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



module Execute_Cycle(clk,rst,RegWriteE,ResultSrcE,MemWriteE,JumpE,BranchE,ALUControlE,ALUSrcE,RD1E,RD2E,
                     PCE,RdE,Rs1E,Rs2E,ImmExtE,PCPlus4E,PCSrcE,RegWriteM,ResultSrcM,
                     MemWriteM,ALUResultM,WriteDataM,RdM,PCPlus4M,PCTargetE,ResultW_E,ForwardAE,ForwardBE,ALUResultM_prev);
                     
 input clk,rst;
 input RegWriteE,MemWriteE,JumpE,BranchE,ALUSrcE;
 input [1:0] ResultSrcE,ForwardAE,ForwardBE;
 input [2:0]ALUControlE;
 input [31:0]RD1E,RD2E,PCE,ImmExtE,PCPlus4E;
 input [4:0]RdE,Rs1E,Rs2E;
 input [31:0]ResultW_E;
 input [31:0]ALUResultM_prev;
 
  
 output RegWriteM,MemWriteM,PCSrcE;
 output [1:0]ResultSrcM;
 output [31:0]ALUResultM,WriteDataM,PCPlus4M,PCTargetE;
 output [4:0]RdM;
 
 wire ZeroE;
 wire [31:0] SrcAE;
 wire [31:0] SrcBE;
 wire [31:0]RD2E_mux;
 wire [31:0] WriteDataE=RD2E_mux;
 wire [31:0] ALUResultE;
 
 reg RegWriteE_reg,MemWriteE_reg;
 reg [1:0]ResultSrcE_reg;
 reg [31:0] ALUResultE_reg,WriteDataE_reg,PCPlus4E_reg;
 reg [4:0]RdE_reg;
 
 mux2 mux2_1(.a(RD1E),
             .b(ResultW_E),
             .c(ALUResultM_prev),
             .s(ForwardAE),
             .result(SrcAE));
             
 mux2 mux2_2(.a(RD2E),
             .b(ResultW_E),
             .c(ALUResultM_prev),
             .s(ForwardBE),
             .result(RD2E_mux));             
 
mux muxE(.a(RD2E_mux),
         .b(ImmExtE),
         .s(ALUSrcE),
         .result(SrcBE)); 
         
ALU2 aluE(.A(SrcAE),
          .B(SrcBE),
          .ALUControl(ALUControlE),
          .Result(ALUResultE),
          .Zero(ZeroE),
          .Overflow());
         
PC_ALU pc_ALUE(.a(PCE),
              .b(ImmExtE),
              .c(PCTargetE));                   
 
 
 always @(posedge clk or negedge rst) begin 
 
 if(rst==1'b0)begin
 
 RegWriteE_reg<=1'b0;
 MemWriteE_reg<=1'b0;
 ResultSrcE_reg<=2'b00;
 ALUResultE_reg<=32'd0;
 WriteDataE_reg<=32'd0;
 RdE_reg<=5'd0;
 PCPlus4E_reg<=32'd0;
 
 end
 
 else begin
 
 RegWriteE_reg<=RegWriteE;
 MemWriteE_reg<= MemWriteE;
 ResultSrcE_reg<=ResultSrcE;
 ALUResultE_reg<=ALUResultE;
 WriteDataE_reg<=WriteDataE;
 RdE_reg<=RdE;
 PCPlus4E_reg<=PCPlus4E;
 
 end
 
 end
 
 assign PCSrcE=(JumpE |(ZeroE & BranchE));
 assign RegWriteM=RegWriteE_reg;
 assign ResultSrcM=ResultSrcE_reg;
 assign MemWriteM=MemWriteE_reg;
 assign ALUResultM=ALUResultE_reg;
 assign WriteDataM=WriteDataE_reg;
 assign RdM=RdE_reg;
 assign PCPlus4M=PCPlus4E_reg;
                     
endmodule

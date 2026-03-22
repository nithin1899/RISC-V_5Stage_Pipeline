`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2026 15:20:07
// Design Name: 
// Module Name: Memory_Cylce
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


module Memory_Cylce(clk,rst,RegWriteM,ResultSrcM,MemWriteM,ALUResultM,WriteDataM,RdM,PCPlus4M,RegWriteW,ResultSrcW,ALUResultW,ReadDataW,RdW,PCPlus4W);

input clk,rst,RegWriteM;
input [1:0]ResultSrcM;
input MemWriteM;
input [31:0]ALUResultM,WriteDataM,PCPlus4M;
input [4:0]RdM;

output RegWriteW;
output [1:0]ResultSrcW;
output [31:0]ALUResultW,ReadDataW,PCPlus4W;
output [4:0]RdW;

wire [31:0]RDM;

reg RegWriteM_reg;
reg [1:0]ResultSrcM_reg;
reg [31:0]ALUResultM_reg,RDM_reg,RdM_reg,PCPlus4M_reg;

Data_Memory data_Memory(.clk(clk),
                        .WE(MemWriteM),
                        .A(ALUResultM),
                        .WD(WriteDataM),
                        .RD(RDM)); 

always @(posedge clk or negedge rst)begin 
if(rst==1'b0)begin 

RegWriteM_reg=1'b0;
ResultSrcM_reg=2'b00;
ALUResultM_reg=32'd0;
RDM_reg=32'd0;
RdM_reg=5'd0;
PCPlus4M_reg=32'd0;

end

else begin 

RegWriteM_reg=RegWriteM;
ResultSrcM_reg=ResultSrcM;
ALUResultM_reg=ALUResultM;
RDM_reg=RDM;
RdM_reg=RdM;
PCPlus4M_reg=PCPlus4M;

end

end

assign RegWriteW=RegWriteM_reg;
assign ResultSrcW=ResultSrcM_reg;
assign ALUResultW=ALUResultM_reg;
assign ReadDataW=RDM_reg;
assign RdW=RdM_reg;
assign PCPlus4W=PCPlus4M_reg;


endmodule

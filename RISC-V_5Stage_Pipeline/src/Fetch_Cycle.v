`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2026 16:35:59
// Design Name: 
// Module Name: Fetch_Cycle
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



module Fetch_Cycle(clk,rst,PCSrcE,InstrD,PCD,PCPlus4D,PCTargetE);

input clk,rst,PCSrcE;
output [31:0]InstrD,PCD,PCPlus4D;
input [31:0]PCTargetE;

wire [31:0]PCNextF,PCF,PCPlus4F,InstrF;

reg [31:0]InstrF_reg,PCF_reg,PCPlus4F_reg;


mux mux_PC(.a(PCPlus4F),
           .b(PCTargetE),
           .s(PCSrcE),
           .result(PCNextF));
           
PC pc(.PC_Next(PCNextF),
      .clk(clk),
      .rst(rst),
      .PC(PCF));
      
PC_ALU pc_ALU(.a(PCF),
              .b(32'd4),
              .c(PCPlus4F));
              
Instruction_Memory instruction_Memory(.A(PCF),
                                      .rst(rst),
                                      .RD(InstrF));                                         

always @(posedge clk or negedge rst)begin 
if(rst==1'b0)begin 
          InstrF_reg<=32'd0;
          PCF_reg<=32'd0;
          PCPlus4F_reg<=32'd0;      
end
  
else begin 
  InstrF_reg<=InstrF;
  PCF_reg<=PCF;
  PCPlus4F_reg<=PCPlus4F;
end

end
  
assign InstrD=(rst==1'b0)?32'd0:InstrF_reg;
assign PCD=(rst==1'b0)?32'd0:PCF_reg;
assign PCPlus4D=(rst==1'b0)?32'd0:PCPlus4F_reg;

endmodule

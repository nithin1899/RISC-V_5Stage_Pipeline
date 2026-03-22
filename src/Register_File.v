`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2026 11:34:34
// Design Name: 
// Module Name: Register_File
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


module Register_File(clk,rst,A1,A2,A3,WE3,WD3,RD1,RD2);

input clk,rst,WE3;
input [4:0]A1,A2,A3;
input [31:0]WD3;
output [31:0]RD1,RD2;

reg  [31:0] RegMem[31:0];

always @(posedge clk)
begin 
if(WE3)
RegMem[A3]<=WD3;
end

assign RD1=(rst)? 32'd0:RegMem[A1];
assign RD2=(rst)? 32'd0:RegMem[A2]; 

initial begin 
RegMem[1]=32'd10;
RegMem[2]=32'd20;
end
endmodule

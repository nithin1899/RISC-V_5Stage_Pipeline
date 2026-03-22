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

module Data_Memory(clk,WE,A,WD,RD);

input clk,WE;
input [31:0]A,WD;
output [31:0]RD;

reg [31:0]Data_Mem[1023:0];

always @(posedge clk)
begin 
if(WE)
Data_Mem[A[31:2]]<=WD;
end

assign RD=(WE==1'b0)?Data_Mem[A[31:2]]:32'd0;

initial begin
    Data_Mem[0] = 32'd42;   // some test value
    // ... other locations
end
                                            
endmodule
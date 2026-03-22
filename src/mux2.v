`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2026 15:48:49
// Design Name: 
// Module Name: mux2
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


module mux2(a,b,c,s,result);
    input [31:0]a,b,c;
input [1:0]s;
output [31:0]result;

assign result=(s==2'b00)?a:
              (s==2'b01)?b:c;
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2026 01:10:45
// Design Name: 
// Module Name: ALU2
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


//module ALU2(A,B,ALUControl,Result,Zero,Overflow);

//input [31:0]A,B;
//input [2:0]ALUControl;
//output reg [31:0]Result;
//output Zero,Overflow;

//always @(*) begin 
//case(ALUControl)
//3'd0:Result=A+B;
//3'd1:Result=A+~B+1;
//3'd2:Result=A&B;
//3'd3:Result=A|B;
//default:Result=32'd0;
//endcase
//end

//assign Overflow=(ALUControl==3'd0)?(A[31]==B[31] && Result[31]!=A[31]):
//                (ALUControl==3'd1)?(A[31]!=B[31] && Result[31]!=A[31]):
//                1'b0;
//assign Zero=(Result==0)?1'b1:1'b0;


//endmodule

module ALU2(A,B,ALUControl,Result,Zero,Overflow);

input [31:0]A,B;
input [2:0]ALUControl;
output [31:0]Result;
output Zero,Overflow;

wire [31:0]mux_1;
wire [31:0]sum;
wire [31:0]a_and_b;
wire [31:0]a_or_b;
wire [31:0]not_b;
wire [31:0]slt;
wire [31:0]mux_2;
wire Cout;

assign not_b=~B;
assign mux_1=(ALUControl[0]==1'b0)? B:not_b;
assign {Cout,sum}=A+mux_1+ALUControl[0];
assign a_and_b=A&B;
assign a_or_b=A|B;
assign Zero=~(|Result);
assign slt={{31{1'b0}},sum[31]};
assign Overflow=(~(ALUControl[0] ^ A[31] ^ B[31]))&(A[31] ^ sum[31])&(~ALUControl[1]);

assign mux_2=(ALUControl[2:0]==3'b000)? sum:
             (ALUControl[2:0]==3'b001)? sum:
             (ALUControl[2:0]==3'b010)? a_and_b :
             (ALUControl[2:0]==3'b011)? a_or_b:
             (ALUControl[2:0]==3'b101)? slt:{32{1'b0}};
assign Result=mux_2;


endmodule
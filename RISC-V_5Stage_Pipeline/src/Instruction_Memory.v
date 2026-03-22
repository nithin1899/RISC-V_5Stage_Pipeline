`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2026 11:41:35
// Design Name: 
// Module Name: Instruction_Memory
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


//module Instruction_Memory(A,rst,RD);
//input [31:0]A;
//input rst;
//output [31:0]RD;
//reg [31:0]Instr_Mem[1023:0];

//assign RD=(~rst)? 32'd0:Instr_Mem[A[31:2]];

//initial
//begin 
//Instr_Mem[0] = 32'b00000000001000001000000110110011;
//Instr_Mem[1] = 32'b00000000001000001000001000110011;
//end

//endmodule

module Instruction_Memory(A, rst, RD);
    input [31:0] A;
    input rst;
    output [31:0] RD;
    reg [31:0] Instr_Mem[1023:0];

    assign RD = (~rst) ? 32'd0 : Instr_Mem[A[31:2]];

    initial begin
        Instr_Mem[0] = 32'b00000000001000001000000110110011; // add x3, x1, x2
    Instr_Mem[1] = 32'b00000000001000011000001000110011; // add x4, x3, x2
    Instr_Mem[2] = 32'b01000000001000101000001010110011; // sub x5, x4, x3
    Instr_Mem[3] = 32'b00000000000000001000001100000011; // lw x6, 0(x0)
    Instr_Mem[4] = 32'b00000000011000001010010000100011; // sw x6, 4(x0)
    end
endmodule

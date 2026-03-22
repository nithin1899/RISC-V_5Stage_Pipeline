`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2026 03:16:18
// Design Name: 
// Module Name: Hazard_Unit
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


module Hazard_Unit(rst, RegWriteM,RegWriteW,RdM,RdW,Rs1E,Rs2E,ForwardAE,ForwardBE);

    input rst, RegWriteM, RegWriteW;
    input [4:0] RdM,RdW,Rs1E,Rs2E;
    output [1:0] ForwardAE, ForwardBE;
    
    assign ForwardAE = (rst == 1'b0) ? 2'b00 : 
                       ((RegWriteM == 1'b1) & (RdM != 5'h00) & (RdM == Rs1E)) ? 2'b10 :
                       ((RegWriteW == 1'b1) & (RdW != 5'h00) & (RdW == Rs1E)) ? 2'b01 : 2'b00;
                       
    assign ForwardBE = (rst == 1'b0) ? 2'b00 : 
                       ((RegWriteM == 1'b1) & (RdM != 5'h00) & (RdM == Rs2E)) ? 2'b10 :
                       ((RegWriteW == 1'b1) & (RdW != 5'h00) & (RdW == Rs2E)) ? 2'b01 : 2'b00;

endmodule

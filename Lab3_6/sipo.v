`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 10:08:38 AM
// Design Name: 
// Module Name: sipo_shift_reg
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

module sipo_shift_reg (
    input  wire CLK, RST, SI,
    output reg [3:0] Q
);
    always @(posedge CLK or posedge RST) begin
        if (RST) Q <= 4'b0000;
        else Q <= {SI, Q[3:1]};
    end
endmodule

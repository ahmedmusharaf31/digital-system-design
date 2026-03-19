`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 07:05:05 AM
// Design Name: 
// Module Name: reg_generic
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

module reg_generic #(
    parameter WIDTH=8
)(
    input  wire CLK, RST,
    input  wire [WIDTH-1:0] D,
    output reg  [WIDTH-1:0] Q
);
    always @(posedge CLK or posedge RST) begin
        if (RST) Q <= 0;
        else     Q <= D;
    end
endmodule

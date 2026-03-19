`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 04:44:42 AM
// Design Name: 
// Module Name: mux5to1_3bit
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

module mux5to1_3bit (
    input  [2:0] U, V, W, X, Y,
    input  [2:0] s,
    output reg [2:0] M
);
    always @(*) begin
        case (s)
            3'b000: M = U;
            3'b001: M = V;
            3'b010: M = W;
            3'b011: M = X;
            default: M = Y;
        endcase
    end
endmodule

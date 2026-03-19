`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2025 02:22:55 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
input [31:0] A,
input [31:0] B,
input [2:0] alu_sel, // 6 operations
output reg [31:0] res
);

always @(*) begin
    case(alu_sel)
    3'd0:   res=0;
    3'd1:   res=A+B;
    3'd2:   res=A-B;
    3'd3:   res=A&B;
    3'd4:   res=A/B;
    3'd5:   res=~A;
    3'd6:   res=A;
    default: res=3'd0;
    endcase
end
endmodule

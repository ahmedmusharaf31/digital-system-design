`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 05:06:11 AM
// Design Name: 
// Module Name: priority_encoder_4to2
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

module priority_encoder_4to2 (
    input  [3:0] In_A,
    output reg [1:0] Out_Y
);
    always @(*) begin
        if (In_A[3]) Out_Y = 2'b11;
        else if (In_A[2]) Out_Y = 2'b10;
        else if (In_A[1]) Out_Y = 2'b01;
        else if (In_A[0]) Out_Y = 2'b00;
        else Out_Y = 2'b00;
    end
endmodule

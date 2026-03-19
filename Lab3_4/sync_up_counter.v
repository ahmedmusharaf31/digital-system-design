`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 09:54:14 AM
// Design Name: 
// Module Name: sync_up_counter
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

module sync_up_counter (
    input  wire CLK, RST,
    output reg [3:0] Q
);
    always @(posedge CLK or posedge RST) begin
        if (RST) Q <= 4'b0000;
        else     Q <= Q + 1;
    end
endmodule

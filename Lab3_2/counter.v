`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 06:51:38 AM
// Design Name: 
// Module Name: counter
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

module counter (
    input  wire CLK, RST,
    output reg [4:0] COUNT
);
    function [4:0] next_val;
        input [4:0] curr;
        begin
            next_val = curr + 1;
        end
    endfunction

    always @(posedge CLK or posedge RST) begin
        if (RST) COUNT <= 5'b00000;
        else COUNT <= next_val(COUNT);
    end
endmodule

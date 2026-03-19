`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 10:02:18 AM
// Design Name: 
// Module Name: async_down_counter
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

module async_down_counter (
    input wire CLK, RST,
    output reg [3:0] Q
);
    always @(posedge CLK or posedge RST) begin
        if (RST) Q <= 4'b1111;
        else begin
            case (Q)
                4'b1111: Q <= 4'b1110;
                4'b1110: Q <= 4'b1101;
                4'b1101: Q <= 4'b1100;
                4'b1100: Q <= 4'b1011;
                4'b1011: Q <= 4'b1010;
                4'b1010: Q <= 4'b1001;
                4'b1001: Q <= 4'b1000;
                4'b1000: Q <= 4'b0111;
                4'b0111: Q <= 4'b0110;
                4'b0110: Q <= 4'b0101;
                4'b0101: Q <= 4'b0100;
                4'b0100: Q <= 4'b0011;
                4'b0011: Q <= 4'b0010;
                4'b0010: Q <= 4'b0001;
                4'b0001: Q <= 4'b0000;
                4'b0000: Q <= 4'b1111;
            endcase
        end
    end
endmodule

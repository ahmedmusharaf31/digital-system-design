`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2025 11:02:30 PM
// Design Name: 
// Module Name: bcd_seven_segment
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


module hex_decoder (
    input [3:0] bin,
    output reg [6:0] seg
);
    always @(*) begin
        case (bin)
            4'b0000: seg = 7'b1000000; // 0
            4'b0001: seg = 7'b1111001; // 1
            4'b0010: seg = 7'b0100100; // 2
            4'b0011: seg = 7'b0110000; // 3
            4'b0100: seg = 7'b0011001; // 4
            4'b0101: seg = 7'b0010010; // 5
            4'b0110: seg = 7'b0000010; // 6
            4'b0111: seg = 7'b1111000; // 7
            4'b1000: seg = 7'b0000000; // 8
            4'b1001: seg = 7'b0010000; // 9
            4'b1010: seg = 7'b0001000; // A
            4'b1011: seg = 7'b0000011; // B
            4'b1100: seg = 7'b1000110; // C
            4'b1101: seg = 7'b0100001; // D
            4'b1110: seg = 7'b0000110; // E
            4'b1111: seg = 7'b0001110; // F
            default: seg = 7'b1111111; // Blank display for invalid values
        endcase
    end
endmodule
	
module top_module (
    input [3:0] SW,        // 4-bit switch input
    output [6:0] HEX0,     // 7-segment display output
    output [7:0] AN        // Common anode control for Nexys 4 DDR
);
    // Instantiate hex_decoder for a single 7-segment display
    hex_decoder h0 (.bin(SW[3:0]), .seg(HEX0));

    // Enable only one seven-segment display (Active-Low Configuration)
    assign AN = 8'b11111110; // Enable only AN0, disable others
endmodule

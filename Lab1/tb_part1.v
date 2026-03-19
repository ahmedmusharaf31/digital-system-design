`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 03:48:01 AM
// Design Name: 
// Module Name: tb_part1
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

module tb_part1;
    reg [15:0] SW;
    wire [15:0] LED;

    part1 uut (.SW(SW), .LED(LED));

    initial begin
        SW = 16'h0000; #10;
        SW = 16'hAAAA; #10;
        SW = 16'h5555; #10;
        SW = 16'hFFFF; #10;
        $finish;
    end
endmodule

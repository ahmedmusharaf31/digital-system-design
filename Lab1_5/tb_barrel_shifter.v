`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 06:12:07 AM
// Design Name: 
// Module Name: tb_barrel_shifter
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

module tb_barrel_shifter;
    reg  [7:0] data;
    reg  [2:0] amt;
    wire [7:0] out;

    barrel_shifter uut (
        .data(data),
        .amt(amt),
        .out(out)
    );

    initial begin
        data = 8'b10110010;

        amt = 3'd0; #10;   
        amt = 3'd1; #10;   
        amt = 3'd2; #10;   
        amt = 3'd3; #10;   
        amt = 3'd4; #10;   
        amt = 3'd5; #10;   
        amt = 3'd6; #10;   
        amt = 3'd7; #10;   
        
        $finish;
    end
endmodule

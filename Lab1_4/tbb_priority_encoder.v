`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 05:11:18 AM
// Design Name: 
// Module Name: tb_priority_encoder
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


`timescale 1ns/1ps
module tb_priority_encoder;
    reg  [3:0] In_A;
    wire [1:0] Out_Y;

    priority_encoder_4to2 uut (.In_A(In_A), .Out_Y(Out_Y));

    initial begin
        In_A=4'b0000; #10;
        In_A=4'b0001; #10;
        In_A=4'b0010; #10;
        In_A=4'b0100; #10;
        In_A=4'b1000; #10;
        In_A=4'b1010; #10;
        $finish;
    end
endmodule

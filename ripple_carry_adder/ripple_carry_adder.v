`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2025 07:15:04 PM
// Design Name: 
// Module Name: ripple_adder
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


module full_adder(
 input a, b, cin,
 output sum, cout
);
   assign sum = a ^ b ^ cin;
   assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

// 4-bit Ripple Carry Adder Module
module ripple_carry_adder (
   input [3:0] A, B,
   input cin,
   output [3:0] sum,
   output cout
);
   wire c1, c2, c3;
 
   full_adder FA0 (.a(A[0]), .b(B[0]), .cin(cin), .sum(sum[0]), .cout(c1));
   full_adder FA1 (.a(A[1]), .b(B[1]), .cin(c1), .sum(sum[1]), .cout(c2));
   full_adder FA2 (.a(A[2]), .b(B[2]), .cin(c2), .sum(sum[2]), .cout(c3));
   full_adder FA3 (.a(A[3]), .b(B[3]), .cin(c3), .sum(sum[3]), .cout(cout));
endmodule

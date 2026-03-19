`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2025 03:52:29 PM
// Design Name: 
// Module Name: Lab6
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

// Half Adder Module
//module HA(sum, carry, a, b);
//    output sum, carry;
//    input a, b;
//    assign sum = a ^ b;
//    assign carry = a & b;
//endmodule

//// Full Adder Module
//module FA(sum, carry, a, b, cin);
//    output sum, carry;
//    input a, b, cin;
//    assign sum = a ^ b ^ cin;
//    assign carry = (a & b) | (a & cin) | (b & cin);
//endmodule

//// 6x6 Carry Save Reduction Multiplier
//module multiply6x6(product, A, B);
//    output [11:0] product;
//    input [5:0] A, B;

//    wire [5:0] pp[5:0]; // Partial products

//    // Generate partial products
//    genvar i, j;
//    generate
//        for (i = 0; i < 6; i = i + 1) begin
//            for (j = 0; j < 6; j = j + 1) begin
//                assign pp[i][j] = A[j] & B[i];
//            end
//        end
//    endgenerate

//    // Intermediate wires for sum and carry
//    wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17;
//    wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17;

//    // Level 0
//    HA HA1(product[1], c1, pp[0][1], pp[1][0]);
//    FA FA1(s1, c2, pp[0][2], pp[1][1], pp[2][0]);
//    FA FA2(s2, c3, pp[0][3], pp[1][2], pp[2][1]);
//    FA FA3(s3, c4, pp[0][4], pp[1][3], pp[2][2]);
//    FA FA4(s4, c5, pp[0][5], pp[1][4], pp[2][3]);
//    HA HA2(s5, c6, pp[1][5], pp[2][4]);

//    // Level 1
//    FA FA5(s6, c7, s1, pp[3][0], c1);
//    FA FA6(s7, c8, s2, pp[3][1], c2);
//    FA FA7(s8, c9, s3, pp[3][2], c3);
//    FA FA8(s9, c10, s4, pp[3][3], c4);
//    FA FA9(s10, c11, s5, pp[3][4], c5);
//    HA HA3(s11, c12, pp[3][5], c6);

//    // Level 2
//    FA FA10(s12, c13, s6, pp[4][0], c7);
//    FA FA11(s13, c14, s7, pp[4][1], c8);
//    FA FA12(s14, c15, s8, pp[4][2], c9);
//    FA FA13(s15, c16, s9, pp[4][3], c10);
//    FA FA14(s16, c17, s10, pp[4][4], c11);
//    HA HA4(s17, product[10], pp[4][5], c12);

//    // Final CPA Stage
//    assign product[0] = pp[0][0];
//    assign product[2] = s6;
//    assign product[3] = s12;
//    assign product[4] = s13;
//    assign product[5] = s14;
//    assign product[6] = s15;
//    assign product[7] = s16;
//    assign product[8] = s17;
//    assign product[9] = c17;
//    assign product[11] = 0; // Unused bit for 12-bit output

//endmodule


/*
module multiply6bits(product, x, y); output [11:0] product; input [5:0] x, y; wire p00,p01,p02,p03,p04,p05, p10,p11,p12,p13,p14,p15, p20,p21,p22,p23,p24,p25, p30,p31,p32,p33,p34,p35, p40,p41,p42,p43,p44,p45, p50,p51,p52,p53,p54,p55; assign p00=x[0]&y[0]; assign p01=x[1]&y[0]; assign p02=x[2]&y[0]; assign p03=x[3]&y[0]; assign p04=x[4]&y[0]; assign p05=x[5]&y[0]; assign p10=x[0]&y[1]; assign p11=x[1]&y[1]; assign p12=x[2]&y[1]; assign p13=x[3]&y[1]; assign p14=x[4]&y[1]; assign p15=x[5]&y[1]; assign p20=x[0]&y[2]; assign p21=x[1]&y[2]; assign p22=x[2]&y[2]; assign p23=x[3]&y[2]; assign p24=x[4]&y[2]; assign p25=x[5]&y[2]; assign p30=x[0]&y[3]; assign p31=x[1]&y[3]; assign p32=x[2]&y[3]; assign p33=x[3]&y[3]; assign p34=x[4]&y[3]; assign p35=x[5]&y[3]; assign p40=x[0]&y[4]; assign p41=x[1]&y[4]; assign p42=x[2]&y[4]; assign p43=x[3]&y[4]; assign p44=x[4]&y[4]; assign p45=x[5]&y[4]; assign p50=x[0]&y[5]; assign p51=x[1]&y[5]; assign p52=x[2]&y[5]; assign p53=x[3]&y[5]; assign p54=x[4]&y[5]; assign p55=x[5]&y[5]; assign product[0] = p00; wire s1,c1,s2,c2,s3,c3,s4,c4,s5,c5,s6,c6; HA HA1(s1,c1,p01,p10); FA FA1(s2,c2,p02,p11,p20); FA FA2(s3,c3,p03,p12,p21); FA FA3(s4,c4,p04,p13,p22); FA FA4(s5,c5,p05,p14,p23); FA FA5(s6,c6,p15,p24,p25); wire s7,c7,s8,c8,s9,c9,s10,c10,s11,c11; FA FA6(s7,c7,s2,c1,p30); FA FA7(s8,c8,s3,c2,p31); FA FA8(s9,c9,s4,c3,p32); FA FA9(s10,c10,s5,c4,p33); FA FA10(s11,c11,s6,c5,p34); wire s12,c12,s13,c13,s14,c14,s15,c15; FA FA11(s12,c12,s8,c7,p40); FA FA12(s13,c13,s9,c8,p41); FA FA13(s14,c14,s10,c9,p42); FA FA14(s15,c15,s11,c10,p43); wire s16,c16,s17,c17,s18,c18; FA FA15(s16,c16,s13,c12,p50); FA FA16(s17,c17,s14,c13,p51); FA FA17(s18,c18,s15,c14,p52); wire [11:0] sum, carry; assign sum = {c18,s18,s17,s16,s15,s14,s13,s12,s7,s1,p00,1'b0}; assign carry = {1'b0,c17,c16,c15,c14,c13,c12,c11,c10,c9,c8,1'b0}; assign product = sum + carry; endmodule
*/


module multiply6x6 (OUT, clk, rst,
IN, A, B, C);
input clk, rst;
input A, B, C, IN;
output reg OUT;
wire w;
reg x;
always @ (posedge clk)
begin
if (!rst)
OUT <= 0;
else
OUT <= w;
end
always @ (posedge clk)
begin
if (!rst)
x <= 0;
else
case (IN)
0: x <= x;
1: x <= ~x;
endcase
end
assign w = ((A | B) |x )| (w & (C & ~x));
endmodule


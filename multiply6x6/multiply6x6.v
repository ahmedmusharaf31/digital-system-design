`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 01:25:15 AM
// Design Name: 
// Module Name: multiply6x6
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


module HA(sum,carry,A,B);
    output sum, carry;
    input A,B;
    
    assign sum=A^B;
    assign carry=A&B;
endmodule

module FA(sum, carry, A,B, cin);
    output sum, carry;
    input A,B,cin;
    
    assign sum=A^B^cin;
    assign carry= (A&B)| (B&cin) | (A&cin);
endmodule

module multiply6x6(
prod, A, B);

input [5:0] A,B;
output [11:0] prod;

wire s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29;
wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29;

reg [5:0]p[5:0];
integer i,j;

always @ (*)begin
        for(i=0;i<6;i=i+1)
            for(j=0;j<6;j=j+1)
                p[i][j]<=A[j]&B[i];
end


// Level 0
HA h1(s0,c0,p[0][1],p[1][0]);
FA f1(s1,c1,p[0][2],p[1][1],p[2][0]);
FA f2(s2,c2,p[0][3],p[1][2],p[2][1]);
FA f3(s3,c3,p[0][4],p[1][3],p[2][2]);
FA f4(s4,c4,p[0][5],p[1][4],p[2][3]);
HA h2(s5,c5,p[1][5],p[2][4]);


// Level 1
HA h3(s6,c6,s1,c0);
FA f5(s7,c7,s2,c1,p[3][0]);
FA f6(s8,c8,s3,c2,p[3][1]);
FA f7(s9,c9,s4,c3,p[3][2]);
FA f8(s10,c10,s5,c4,p[3][3]);
FA f9(s11,c11,p[2][5],c5,p[3][4]);


// Level 2
HA h4(s12,c12,s7,c6);
FA f10(s13,c13,s8,c7,p[4][0]);
FA f11(s14,c14,s9,c6,p[4][1]);
FA f12(s15,c15,s10,c9,p[4][2]);
FA f13(s16,c16,s11,c10,p[4][3]);
FA f14(s17,c17,p[3][5],c11,p[4][4]);


// Level 3
HA h5(s18,c18,s13,c12);
FA f15(s19,c19,s14,c13,p[5][0]);
FA f16(s20,c20,s15,c14,p[5][1]);
FA f17(s21,c21,s16,c15,p[5][2]);
FA f18(s22,c22,s17,c16,p[5][3]);
FA f19(s23,c23,p[4][5],c17,p[5][4]);


// Level 4
HA h6(s24,c24,s19,c18);
FA f20(s25,c25,s20,c19,c24);
FA f21(s26,c26,s21,c20,c25);
FA f22(s27,c27,s22,c21,c26);
FA f23(s28,c28,s23,c22,c27);
FA f24(s29,c29,p[5][5],c23,c28);

// Final

assign prod[0]=p[0][0];
assign prod[1]=s0;
assign prod[2]=s6;
assign prod[3]=s12;
assign prod[4]=s18;

assign prod[5]=s24;
assign prod[6]=s25;
assign prod[7]=s26;
assign prod[8]=s27;

assign prod[9]=s28;
assign prod[10]=s29;
assign prod[11]=c29;

endmodule

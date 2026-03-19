`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 12/24/2025 07:05:17 PM
// Design Name:
// Module Name: ahmed
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


//module HA(sum,carry,A,B);
//output sum,carry;
//input A,B;

//assign sum=A^B;
//assign carry=A&B;

//endmodule


//module FA(sum,carry,A,B,cin);
//output sum,carry;
//input A,B,cin;

//assign sum=A^B^cin;
//assign carry=(A&B) | (B&cin) | (A&cin);

//endmodule


//module ahmed(prod, A, B);
//input [3:0] A;
//input [3:0] B;
//output [7:0] prod;

//wire s11,s10,s9,s8,s7,s6,s5,s4,s3,s2,s1,s0;
//wire c11,c10,c9,c8,c7,c6,c5,c4,c3,c2,c1,c0;

//reg [4:0] p[4:0];

//integer i,j;

//always @(*) begin
//    for(i=0;i<4;i=i+1)
//        for(j=0;j<4;j=j+1)
//            p[i][j]=A[j]&B[i];
//end

//// Level 0
//HA HA1(s0,c0,p[0][1],p[1][0]);
//FA FA1(s1,c1,p[0][2],p[1][1],p[2][0]);
//FA FA2(s2,c2,p[0][3],p[1][2],p[2][1]);
//HA HA2(s3,c3,p[1][3],p[2][2]);

//// Level 1
//HA HA3(s4,c4,s1,c0);
//FA FA3(s5,c5,s2,c1,p[3][0]);
//FA FA4(s6,c6,s3,c2,p[3][1]);
//FA FA5(s7,c7,p[2][3],c3,p[3][2]);

//// Level 2
//HA HA4(s8,c8,s5,c4);
//FA FA6(s9,c9,s6,c8,c5);
//FA FA7(s10,c10,s7,c9,c6);
//FA FA8(s11,c11,p[3][3],c10,c7);

//assign prod[0]=p[0][0];
//assign prod[1]=s0;
//assign prod[2]=s4;
//assign prod[3]=s8;
//assign prod[4]=s9;
//assign prod[5]=s10;
//assign prod[6]=s11;
//assign prod[7]=c11;

//endmodule



//module ahmed(A,B,alu_sel,res);

//input [31:0] A,B;
//input [2:0] alu_sel;
//output reg [31:0] res;

//always @(*) begin
//    case(alu_sel)

//    3'd0: res=0;
//    3'd1: res=A+B;
//    3'd2: res=A-B;
//    3'd3: res=A&B;
//    3'd4: res=A/B;
//    3'd5: res=~A;
//    3'd6: res=A;

//    default: res=32'd0;
//    endcase
//end

//module ahmed(in,out,en,clk,rst);
//input [31:0] in;
//input en,clk,rst;
//output reg [31:0] out;

//always @(posedge clk or posedge rst)begin
//   if(rst) out<=32'h0;

//   else if(en) out<=in;
//end

//endmodule


//module ahmed(
//clk, rst, regwrite,
//readaddr1, readdata1,
//readaddr2, readdata2, writeaddr, writedata);

//input clk, rst, regwrite;
//input [31:0] writedata;
//input [4:0] writeaddr,readaddr1,readaddr2;
//output reg [31:0] readdata1, readdata2;

//reg [31:0] registers [31:0];

//integer i;

//always @(posedge clk or posedge rst)
//begin
//    if (rst) begin
//    for(i=0;i<32;i=i+1)
//        registers[i]<=32'b0;
//    end

//    else if(regwrite && (writeaddr!=5'b0)) begin
//        registers[writeaddr]<=writedata;

//    end
//end

//always @(negedge clk) begin
//    readdata1<=registers[readaddr1];
//end

//always @(negedge clk) begin
//    readdata2<=registers[readaddr2];
//end

//endmodule


//module ahmed(
//input clk, rst, w,
//output reg z
//);

//reg [3:0] cs,ns;

//parameter s0=4'b0000;
//parameter s1=4'b0001;
//parameter s2=4'b0010;
//parameter s3=4'b0011;
//parameter s4=4'b0100;
//parameter s5=4'b0101;
//parameter s6=4'b0110;
//parameter s7=4'b0111;
//parameter s8=4'b1000;

//always @(posedge clk or posedge rst) begin
//    if(rst) begin
//        cs<=s0;
//    end else begin
//        cs<=ns;
//    end
//end

//always @(*) begin
//case (cs)

//s0: begin
//if(w==0) begin
//ns=s5; z=0;
//end else begin
//ns=s1; z=0;
//end
//end

//s1: begin
//if(w==0) begin
//ns=s5; z=0;
//end else begin
//ns=s2; z=0;
//end
//end

//s2: begin
//if(w==0) begin
//ns=s5; z=0;
//end else begin
//ns=s3; z=0;
//end
//end

//s3: begin
//if(w==0) begin
//ns=s5; z=0;
//end else begin
//ns=s4; z=0;
//end
//end

//s4: begin
//if(w==0) begin
//ns=s5; z=0;
//end else begin
//ns=s4; z=1;
//end
//end

//s5: begin
//if(w==0) begin
//ns=s6; z=0;
//end else begin
//ns=s1; z=0;
//end
//end

//s6: begin
//if(w==0) begin
//ns=s7; z=0;
//end else begin
//ns=s1; z=0;
//end
//end

//s7: begin
//if(w==0) begin
//ns=s8; z=1;
//end else begin
//ns=s1; z=0;
//end
//end

//s8: begin
//if(w==0) begin
//ns=s8; z=1;
//end else begin
//ns=s1; z=0;
//end
//end

//default: ns=ns;

//endcase
//end

//endmodule



//module ahmed(clk, rst, w, z);
//input clk, rst, w;
//output reg z;

//reg [3:0] sreg0, sreg1;

//always @(posedge clk) begin
//if(rst) begin
//    sreg0<=4'b1111;
//    sreg1<=4'b0000;
//end else begin
//    sreg0<={sreg0[2:0],w};
//    sreg1<={sreg1[2:0],w};
//end
//end

//always @(*) begin
//    z=(sreg1==4'b1111) || (sreg0==4'b0000);
//end

//endmodule


module ahmed(
    input clk, rst,
    output a, b, c, d, e, f, g, dp,
    output [7:0] an,
    input up, down
  );

  reg [3:0] first;
  reg [3:0] second;
  reg [24:0] delay; // 0.1s

  always @(posedge clk or posedge rst)
  begin
    if(rst)
      delay<=0;
    else
    begin
      delay<=delay+1;
    end
  end

  reg up_reg;
  reg down_reg;

  always @(posedge clk)
  begin
    up_reg<=up;
    down_reg<=down;
  end

  wire up_enable=(up_reg==0 && up==1)?1:0;
  wire down_enable=(down_reg==0 && down==1)?1:0;

  always @(posedge clk or posedge rst)
  begin
    if(rst)
    begin
      first<=0;
      second<=0;
    end
    else if(up_enable)
    begin
      if(first==4'd9)
      begin
        first<=0;
        if(second==4'd9)
          second<=0;
        else
          second<=second+1;
      end
      else
        first<=first+1;
    end

    else if(down_enable)
    begin
      if(first==4'd0)
      begin
        first<=9;
        if(second==4'd0)
          second<=9;
        else
          second<=second-1;
      end
      else
        first<=first-1;
    end

    else
    begin
      second<=second;
      first<=first;
    end
  end

  localparam N=18;
  reg[N-1:0] count;

  always @(posedge clk or posedge rst)
  begin
    if(rst)
      count<=0;
    else
    begin
      count<=count+1;
    end
  end

  reg [6:0] sseg;
  reg [7:0] an_temp;

  always @(*)
  begin
    case(count[N-1:N-2])

      2'b00:
      begin
        sseg=first;
        an_temp=8'b11111110;
      end

      2'b01:
      begin
        sseg=second;
        an_temp=8'b11111101;
      end

      2'b10:
      begin
        sseg=6'ha;
        an_temp=8'b11111011;
      end

      2'b11:
      begin
        sseg=6'ha;
        an_temp=8'b11110111;
      end

    endcase
  end
  assign an=an_temp;

  reg [6:0] sseg_temp;

  always @(*)
  begin
    case(sseg)
      4'd0:
        sseg_temp=7'b1000000;
      4'd1 :
        sseg_temp = 7'b1111001; //1
      4'd2 :
        sseg_temp = 7'b0100100; //2
      4'd3 :
        sseg_temp = 7'b0110000; //3
      4'd4 :
        sseg_temp = 7'b0011001; //4
      4'd5 :
        sseg_temp = 7'b0010010; //5
      4'd6 :
        sseg_temp = 7'b0000010; //6
      4'd7 :
        sseg_temp = 7'b1111000; //7
      4'd8 :
        sseg_temp = 7'b0000000; //8
      4'd9 :
        sseg_temp = 7'b0010000; //9
      default :
        sseg_temp = 7'b0111111; //dash


    endcase
  end

  assign {g,f,e,d,c,b,a}=sseg_temp;
  assign dp=1'b1;

endmodule

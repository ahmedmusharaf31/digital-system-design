`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2025 11:05:15 AM
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

module ahmed(
    input clk, rst,
    output a, b, c, d, e, f, g, dp,
    output [7:0] an,
    input en
);

reg [3:0] first;
reg [3:0] second;
reg [24:0] delay; // 0.1s 

always @(posedge clk or posedge rst) begin
    if(rst) delay<=0;
    else begin
        delay<=delay+1; 
    end
end

//reg up_reg;
//reg down_reg;

//always @(posedge clk) begin
//    up_reg<=en;
//    down_reg<=~en;
//end

//wire up_enable=(up_reg==0 && en==1)?1:0;
//wire down_enable=(down_reg==0 && en==0)?1:0;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        first<=0;
        second<=0;
    end else if(delay==25'd0) begin
    if(en) begin
        if(first==4'd9) begin
            first<=0;
        if(second==4'd9)
            second<=0;
        else 
        second<=second+1;
        end else
        first<=first+1;
        end

    else if(en) begin
        if(first==4'd0) begin
            first<=9;
        if(second==4'd0)
            second<=9;
        else 
        second<=second-1;
        end else
        first<=first-1;
        end
    
    else begin
        second<=second;
        first<=first;
    end
end
end

localparam N=18;
reg[N-1:0] count;

always @(posedge clk or posedge rst) begin
    if(rst) count<=0;
    else begin
        count<=count+1;
    end
end

reg [6:0] sseg;
reg [7:0] an_temp;

always @(*) begin
    case(count[N-1:N-2])
        
     2'b00: begin
        sseg=first;
        an_temp=8'b11111110;
     end
     
     2'b01: begin
        sseg=second;
        an_temp=8'b11111101;
     end

     2'b10: begin
        sseg=6'ha;
        an_temp=8'b11111011;
     end

     2'b11: begin
        sseg=6'ha;
        an_temp=8'b11110111;
     end
     
     endcase
end
assign an=an_temp;

reg [6:0] sseg_temp;

always @(*) begin
    case(sseg)
    4'd0: sseg_temp=7'b1000000;   
    4'd1 : sseg_temp = 7'b1111001; //1
    4'd2 : sseg_temp = 7'b0100100; //2
    4'd3 : sseg_temp = 7'b0110000; //3
    4'd4 : sseg_temp = 7'b0011001; //4
    4'd5 : sseg_temp = 7'b0010010; //5
    4'd6 : sseg_temp = 7'b0000010; //6
    4'd7 : sseg_temp = 7'b1111000; //7
    4'd8 : sseg_temp = 7'b0000000; //8
    4'd9 : sseg_temp = 7'b0010000; //9
    default : sseg_temp = 7'b0111111; //dash 
    
    
    endcase
end

assign {g,f,e,d,c,b,a}=sseg_temp;
assign dp=1'b1;

endmodule

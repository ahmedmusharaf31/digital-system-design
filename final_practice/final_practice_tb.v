`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2025 10:33:52 PM
// Design Name: 
// Module Name: ahmed_tb
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


//module ahmed_tb();
//reg [5:0] A;
//reg [5:0] B;

//wire [7:0] prod;

//ahmed uut(
//    .prod(prod),
//    .A(A),
//    .B(B)
//);

//initial begin
//    $display("Time   |   A   |   B   |   Product");
//    $display("----------------------------------");

//    A=4'b0101; B=4'b1010; #10;
//    A=4'b1000; B=4'b1011; #10;
//    A=4'b0010; B=4'b0101; #10;
//    A=4'b1011; B=4'b0111; #10;
//    A=4'b1101; B=4'b0100; #10;
//    A=4'b1110; B=4'b1101; #10;
    
//    $finish;                    
//end

//initial begin
//    $monitor("%0t   |   %b   |   %b   |   %b",$time, A,B,prod);
//end

//module ahmed_tb();

//reg [31:0] in;
//reg clk;
//reg rst;
//reg en;
//wire [31:0] out;


//ahmed uut(
//    .in(in),
//    .clk(clk),
//    .rst(rst),
//    .en(en),
//    .out(out)
//);

//always #5 clk=~clk;

//initial begin
//    in=0;
//    clk=0;
//    rst=1;
    
//    #10; en=1; rst=0; in=10;
//    #10; in=20;
//    #10 in=30;
//    #10 in=40;
//    #10 en=0; in=41;
//    #10 in=42;
//    #10 in=43;
//    #10 in=44;
    
//    $finish;
//end


//module ahmed_tb();

//reg clk, rst, regwrite;
//reg [31:0] writedata;
//reg [4:0] writeaddr, readaddr1, readaddr2;
//wire [31:0] readdata1, readdata2;

//ahmed uut(
//     .clk(clk),
//     .rst(rst),
//     .regwrite(regwrite),
//     .readaddr1(readaddr1),
//     .readaddr2(readaddr2),
//     .writeaddr(writeaddr),
//     .writedata(writedata),
//     .readdata1(readdata1),
//     .readdata2(readdata2)
//);

//initial begin
//    clk=0;
//    forever #5 clk=~clk;
//end

//initial begin
//    $monitor("Time=%0t | clk=%b rst=%b | WrEn=%b WrAddr=%b WrData=%h | RdAddr1=%b RdData1=%h | RdAddr2=%b RdData2=%h", $time, clk, rst, regwrite, writeaddr, writedata,
//    readaddr1, readdata1, readaddr2, readdata2);
    
//    rst=1;
//    regwrite=0;
//    readaddr1=0;
//    readaddr2=0;
//    writeaddr=0;
//    writedata=32'h0;
    
//    #20;
//    rst=0;
    
//    regwrite=1;
//    writeaddr=5'd5;
//    writedata=32'hADAADAAD;
//    @(posedge clk);
//    #1;
    
//    writeaddr=5'd10; // write to reg 10
//    writedata=32'hDEADBEEF;
//    @(posedge clk);
//    #1;
    
//    regwrite=0;
//    readaddr1=5'd5;
//    readaddr2=5'd10;
//    @(negedge clk);
//    #10;
    
//    regwrite=1;
//    writeaddr=5'd0;
//    writedata=32'hFFFFFFFF;
//    @(posedge clk);
//    #1;
    
//    regwrite=0; // read from reg0 (port 1) and reg5 (port2)
//    readaddr1=5'd0;
//    readaddr2=5'd5;
//    @(negedge clk);
//    #10;

//end

//endmodule


module ahmed_tb();
reg clk, w, rst;
wire z;

ahmed uut(
.clk(clk),
.w(w),
.rst(rst),
.z(z)
);

always #5 clk=~clk;

initial begin
    clk=0;
    rst=1;
    w=0;
    
    #10;
    
    rst=0;
    
    w=1; #10;
    w=1; #10;
    w=1; #10;
    w=1; #10;
    w=1; #10;
    
    w=0; #10;
    
    w=0; #10;
    w=0; #10;
    w=0; #10;
    w=0; #10;
    
end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2025 03:15:42 PM
// Design Name: 
// Module Name: reg_file_tb
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


module reg_file_tb;

reg clk;
reg rst;
reg regwrite;
reg [4:0] readaddr1;
reg [4:0] readaddr2;
reg [4:0] writeaddr;
reg [31:0] writedata;

wire [31:0] readdata1;
wire [31:0] readdata2;

reg_file uut(
    .clk(clk),
    .rst(rst),
    .regwrite(regwrite),
    .readaddr1(readaddr1),
    .readaddr2(readaddr2),
    .writeaddr(writeaddr),
    .writedata(writedata),
    .readdata1(readdata1),
    .readdata2(readdata2)
);

initial begin
    clk=0;
    forever #5 clk=~clk;
end

initial begin
$monitor("Time=%0t | clk=%b rst=%b | WrEn=%b WrAddr=%b WrData=%h | RdAddr1=%b RdData1=%h | RdAddr2=%b RdData2=%h", $time, clk, rst, regwrite, writeaddr, writedata, readaddr1, readdata1, readaddr2, readdata2);

rst=1;
regwrite=0;
readaddr1=0;
readaddr2=0;
writeaddr=0;
writedata=32'h0;
#20;
rst=0;
#1;

regwrite=1;
writeaddr=5'd5; // write to reg 5
writedata=32'hADAADAAD;
@(posedge clk);
#1;

writeaddr=5'd10; // write to reg 10
writedata=32'hDEADBEEF;
@(posedge clk);
#1;
regwrite=0;

readaddr1=5'd5; // read from reg5 (port1) and reg10 (port2)
readaddr2=5'd10;
@(negedge clk);
#10;

regwrite=1; // attempt to write to reg 0 (should remain 0)
writeaddr=5'd0;
writedata=32'hFFFFFFFF;
@(posedge clk);
#1;

regwrite=0; // read from reg0 (port 1) and reg5 (port2)
readaddr1=5'd0;
readaddr2=5'd5;
@(negedge clk);
#10;

$finish;
end

endmodule

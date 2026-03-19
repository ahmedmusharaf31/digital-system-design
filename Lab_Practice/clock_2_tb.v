`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmed Musharaf
// 
// Create Date: 10/23/2025
// Design Name: Digital Clock Testbench
// Module Name: clock_2_tb
// Project Name: Digital Clock
// Target Devices: Simulation / FPGA
// Tool Versions: Vivado 2018.2+
// Description: Testbench for clock_2 module (seconds up to 30, minutes up to 2)
// 
//////////////////////////////////////////////////////////////////////////////////

module clock_2_tb;
reg clk;
reg rst;
wire [6:0] ssd;
wire [7:0] anode;

clock_2 uut(
    .clk(clk),
    .rst(rst),
    .ssd(ssd),
    .anode(anode)
);

initial clk=0;
always #5 clk=~clk;

initial begin
    
    rst=1; #100;
    rst=0;
    
    #500_000_000; // 0.5 sec
    
    $display("Simulation completed at time %t",$time);
    $finish;
end

// optional!!
initial begin
    $monitor("Time=%0t | ANODE=%b | SSD=%b",$time,anode,ssd);
end

endmodule

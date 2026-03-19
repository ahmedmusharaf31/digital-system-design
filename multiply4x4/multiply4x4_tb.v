`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 08:19:36 AM
// Design Name: 
// Module Name: multiply4x4_tb
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


module multiply4x4_tb;

    // Inputs
    reg [3:0] inp1;
    reg [3:0] inp2;

    // Outputs
    wire [7:0] product;

    // Instantiate the Unit Under Test (UUT)
    multiply4x4 uut (
        .product(product), 
        .inp1(inp1), 
        .inp2(inp2)
    );

    // Testbench logic
    initial begin
        // Apply test vectors
        inp1 = 4'b0000; inp2 = 4'b0000; #10; // 0 * 0 = 0
        inp1 = 4'b0001; inp2 = 4'b0001; #10; // 1 * 1 = 1
        inp1 = 4'b0010; inp2 = 4'b0010; #10; // 2 * 2 = 4
        inp1 = 4'b0011; inp2 = 4'b0011; #10; // 3 * 3 = 9
        inp1 = 4'b0100; inp2 = 4'b0100; #10; // 4 * 4 = 16
        inp1 = 4'b0101; inp2 = 4'b0101; #10; // 5 * 5 = 25
        inp1 = 4'b0110; inp2 = 4'b0110; #10; // 6 * 6 = 36
        inp1 = 4'b0111; inp2 = 4'b0111; #10; // 7 * 7 = 49
        inp1 = 4'b1000; inp2 = 4'b1000; #10; // 8 * 8 = 64
        inp1 = 4'b1001; inp2 = 4'b1001; #10; // 9 * 9 = 81
        inp1 = 4'b1010; inp2 = 4'b1010; #10; // 10 * 10 = 100
        inp1 = 4'b1011; inp2 = 4'b1011; #10; // 11 * 11 = 121
        inp1 = 4'b1100; inp2 = 4'b1100; #10; // 12 * 12 = 144
        inp1 = 4'b1101; inp2 = 4'b1101; #10; // 13 * 13 = 169
        inp1 = 4'b1110; inp2 = 4'b1110; #10; // 14 * 14 = 196
        inp1 = 4'b1111; inp2 = 4'b1111; #10; // 15 * 15 = 225

        // Add more test cases if needed
        $stop; // Stop simulation
    end

    // Monitor the outputs
    initial begin
        $monitor("Time: %0t | inp1 = %b | inp2 = %b | product = %b (%d)", 
                 $time, inp1, inp2, product, product);
    end

endmodule

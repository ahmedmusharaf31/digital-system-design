`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 01:27:39 AM
// Design Name: 
// Module Name: multiplier_CSR_6x6_tb
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

module multiplier_CSR_6x6_tb();

// Inputs
    reg [5:0] A;
    reg [5:0] B;

    // Output
    wire [11:0] prod;

    // Instantiate the multiplier module
    multiply6x6 uut (
        .prod(prod),
        .A(A),
        .B(B)
    );

    // Test cases
    initial begin
        $display("Time  |  A      B      |  Product");
        $display("-----------------------------------");

        A = 6'b000000; B = 6'b000000; #10; // 0 * 0 = 000000000000
        A = 6'b000101; B = 6'b000011; #10; // 5 * 3 = 000000000111
        A = 6'b001001; B = 6'b000110; #10; // 9 * 6 = 000000110010
        A = 6'b001111; B = 6'b001111; #10; // 15 * 15 = 000010001111
        A = 6'b011001; B = 6'b010011; #10; // 25 * 19 = 000100101011
        A = 6'b111111; B = 6'b111111; #10; // 63 * 63 = 111110000001

        $finish;
    end

    // Monitor output
    initial begin
        $monitor("%0t    |  %b  %b  |  %b", $time, A, B, prod);
    end
endmodule

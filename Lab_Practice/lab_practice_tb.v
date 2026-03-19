`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2025 12:21:10 AM
// Design Name: 
// Module Name: lab_practice_tb
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

module lab_practice_tb;

    // Inputs
    reg [5:0] A;
    reg [5:0] B;

    // Outputs
    wire [11:0] prod;

    // Instantiate the multiplier
    lab_practice uut (
        .prod(prod),
        .A(A),
        .B(B)
    );

    // Test procedure
    initial begin
        $display("===============================================");
        $display("        6x6 Carry Save Multiplier Testbench     ");
        $display("===============================================");
        $display("    Time   |    A (dec)   B (dec)   |  Product (dec)   Binary");
        $display("---------------------------------------------------------------");

        // Apply test cases
        A = 6'd0;   B = 6'd0;   #10; show;
        A = 6'd1;   B = 6'd1;   #10; show;
        A = 6'd5;   B = 6'd3;   #10; show;
        A = 6'd7;   B = 6'd7;   #10; show;
        A = 6'd9;   B = 6'd15;  #10; show;
        A = 6'd12;  B = 6'd10;  #10; show;
        A = 6'd25;  B = 6'd6;   #10; show;
        A = 6'd32;  B = 6'd31;  #10; show;
        A = 6'd63;  B = 6'd63;  #10; show; // max values (63*63=3969)

        $display("---------------------------------------------------------------");
        $display("Simulation finished!");
        $stop;
    end

    // Task for formatted display
    task show;
        begin
            $display("%8dns | %5d x %5d | %7d   = %b",
                     $time, A, B, prod, prod);
        end
    endtask

endmodule

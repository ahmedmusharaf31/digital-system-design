`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2025 04:30:38 PM
// Design Name: 
// Module Name: proc_tb
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

module proc_tb;
    reg [15:0] DIN;
    reg Resetn, Clock, Run;
    wire Done;

    // Instantiate UUT
    proc UUT (DIN, Resetn, Clock, Run, Done);

    // Clock Generation
    initial begin
        Clock = 0;
        forever #10 Clock = ~Clock; 
    end

    // Test Stimulus
    initial begin
        Resetn = 0;
        Run = 0;
        DIN = 0;
        #25 Resetn = 1;

        // 1. mv r0, #28 (0x101C)
        #10 DIN = 16'h101C; 
        Run = 1; 
        #20 Run = 0; 
        wait (Done); 
        #20; 

        // 2. mvt r1, #0xFF (0x32FF) -> Result: 0xFF00
        DIN = 16'h32FF; 
        Run = 1;
        #20 Run = 0; 
        wait (Done);
        #20;

        // 3. add r1, #0xFF (0x52FF) -> Result: 0xFF00 + 0x00FF = 0xFFFF
        DIN = 16'h52FF;
        Run = 1;
        #20 Run = 0;
        wait (Done);
        #20;

        $stop;
    end
endmodule

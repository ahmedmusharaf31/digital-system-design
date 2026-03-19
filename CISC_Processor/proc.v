`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2025 03:26:00 PM
// Design Name: 
// Module Name: proc
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

module proc (DIN, Resetn, Clock, Run, Done);
    input [15:0] DIN;
    input Resetn, Clock, Run;
    output reg Done;

    // Internal Signals
    reg [15:0] BusWires;
    reg [3:0] Select;    // mux select
    reg rX_in;           // reg enable (FIXED: Changed from [0:7] to single bit)
    wire [0:7] R_in;      // Decoder output (8 bits)
    reg A_in, G_in, IR_in, AddSub;
    
    wire [2:0] III, rX, rY; // Instruction fields
    wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7, A, G, IR; // Register outputs
    wire [15:0] Sum;
    wire Imm;

    // Assignments for Instruction Decoding
    assign III = IR[15:13];
    assign Imm = IR[12];
    assign rX  = IR[11:9];
    assign rY  = IR[2:0];
    
    dec3to8 decX (rX_in, rX, R_in); 
    
    // State Machine Parameters
   
    parameter T0 = 2'b00, T1 = 2'b01, T2 = 2'b10, T3 = 2'b11;
    parameter mv = 3'b000, mvt = 3'b001, add = 3'b010, sub = 3'b011;
    parameter _R0 = 4'b0000, _R1 = 4'b0001, _R2 = 4'b0010, _R3 = 4'b0011,
              _R4 = 4'b0100, _R5 = 4'b0101, _R6 = 4'b0110, _R7 = 4'b0111,
              _G = 4'b1000, 
              _IR8_IR8_0 = 4'b1001,
              _IR7_0_0   = 4'b1010;

    // FSM State variables
    reg [1:0] Tstep_Q, Tstep_D;

    // Control Unit FSM: State Transition
    always @(Tstep_Q, Run, Done) begin
        case (Tstep_Q)
            T0: // Wait for Run to start
                if (Run) Tstep_D = T1;
                else Tstep_D = T0;
            T1: // Execute Cycle 1
                if (Done) Tstep_D = T0;
                else Tstep_D = T2;
            T2: // Execute Cycle 2
                Tstep_D = T3;
            T3: // Execute Cycle 3
                Tstep_D = T0;
            default: Tstep_D = T0;
        endcase
    end

    // Control Unit FSM: Control Outputs
    always @(*) begin
        // Default values
        rX_in = 1'b0; A_in = 1'b0; G_in = 1'b0; IR_in = 1'b0; 
        Done = 1'b0; AddSub = 1'b0; Select = 4'bxxxx;

        case (Tstep_Q)
            T0: begin // Fetch Instruction
                IR_in = 1'b1;
            end

            T1: begin 
                case (III)
                    mv: begin
                        // mv rX, rY OR mv rX, #D
                        if (!Imm) Select = {1'b0, rY}; // Select register rY (0-7)
                        else Select = _IR8_IR8_0;      // Select Immediate
                        rX_in = 1'b1;
                        Done = 1'b1;
                    end
                    mvt: begin
                        // mvt rX, #D
                        Select = _IR7_0_0;
                        rX_in = 1'b1;
                        Done = 1'b1;
                    end
                    add, sub: begin
                        // Step 1 for math: Move rX to A
                        Select = {1'b0, rX};
                        A_in = 1'b1;
                    end
                    default: ;
                endcase
            end

            T2: begin
                case (III)
                    add: begin
                        // add rX, rY OR add rX, #D
                        if (!Imm) Select = {1'b0, rY};
                        else Select = _IR8_IR8_0;
                        G_in = 1'b1;
                        // AddSub remains 0 for Add
                    end
                    sub: begin
                        // sub rX, rY OR sub rX, #D
                        if (!Imm) Select = {1'b0, rY};
                        else Select = _IR8_IR8_0;
                        AddSub = 1'b1; // Perform Subtraction
                        G_in = 1'b1;
                    end
                    default: ; 
                endcase
            end

            T3: begin
                case (III)
                    add, sub: begin
                        // Move result from G to rX
                        Select = _G;
                        rX_in = 1'b1;
                        Done = 1'b1;
                    end
                    default: ;
                endcase
            end
            default: ;
        endcase
    end

    // Write back FSM data using Flip Flops
    always @(posedge Clock, negedge Resetn) begin
        if (!Resetn)
            Tstep_Q <= T0;
        else
            Tstep_Q <= Tstep_D;
    end

    // Multiplexer (BusWires)
    always @(*) begin
        case (Select)
            _R0: BusWires = r0;
            _R1: BusWires = r1;
            _R2: BusWires = r2;
            _R3: BusWires = r3;
            _R4: BusWires = r4;
            _R5: BusWires = r5;
            _R6: BusWires = r6;
            _R7: BusWires = r7;
            _G:  BusWires = G;
            _IR8_IR8_0: BusWires = {{7{IR[8]}}, IR[8:0]}; // Sign extension
            _IR7_0_0:   BusWires = {IR[7:0], 8'b00000000}; // mvt padding
            default: BusWires = 16'b0;
        endcase
    end

    // ALU (Adder/Subtracter)
    // If AddSub is 1, Sum = A - BusWires. Else Sum = A + BusWires
    assign Sum = AddSub ? (A - BusWires) : (A + BusWires);

    // Register Instantiations
    regn reg_0 (BusWires, Resetn, R_in[0], Clock, r0);
    regn reg_1 (BusWires, Resetn, R_in[1], Clock, r1);
    regn reg_2 (BusWires, Resetn, R_in[2], Clock, r2);
    regn reg_3 (BusWires, Resetn, R_in[3], Clock, r3);
    regn reg_4 (BusWires, Resetn, R_in[4], Clock, r4);
    regn reg_5 (BusWires, Resetn, R_in[5], Clock, r5);
    regn reg_6 (BusWires, Resetn, R_in[6], Clock, r6);
    regn reg_7 (BusWires, Resetn, R_in[7], Clock, r7);
    
    regn reg_A (BusWires, Resetn, A_in, Clock, A);
    regn reg_G (Sum, Resetn, G_in, Clock, G);
    regn reg_IR (DIN, Resetn, IR_in, Clock, IR);

endmodule

// Helper Module: 3-to-8 Decoder
module dec3to8 (E, W, Y);
    input E; // Enable
    input [2:0] W;
    output reg [0:7] Y;
   
    always @(*) begin
        if (E == 0)
            Y = 8'b00000000;
        else
            case (W)
                3'b000: Y = 8'b10000000;
                3'b001: Y = 8'b01000000;
                3'b010: Y = 8'b00100000;
                3'b011: Y = 8'b00010000;
                3'b100: Y = 8'b00001000;
                3'b101: Y = 8'b00000100;
                3'b110: Y = 8'b00000010;
                3'b111: Y = 8'b00000001;
            endcase
    end
endmodule

// Helper Module: N-bit Register
module regn (R, Resetn, E, Clock, Q);
    parameter n = 16;
    input [n-1:0] R;
    input Resetn, E, Clock;
    output reg [n-1:0] Q;

    always @(posedge Clock, negedge Resetn) begin
        if (!Resetn)
            Q <= 0;
        else if (E)
            Q <= R;
    end
endmodule

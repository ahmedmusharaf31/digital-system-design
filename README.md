# Digital System Design

All RTL source files, testbenches, and constraint files for **Digital System Design - Fall 2025 - GIKI**.

Built using **Xilinx Vivado** targeting FPGA development.

## Repository Structure

Each folder contains Verilog/SystemVerilog source files (`.v`, `.sv`), testbenches (`_tb`/`tb_`), and constraints (`.xdc`) where applicable.

### Lab Work

| Folder | Description | Files |
|--------|-------------|-------|
| `Lab1` | 8:1 Multiplexer | `part1.v` `mux8to1.v` + 3 testbenches |
| `Lab1_2` | 8:1 Multiplexer (variant) | `mux8to1.v` + testbench |
| `Lab1_3` | 5:1 3-bit Mux, Priority Encoder | `mux5to1_3bit.v` `priority_encoder_4to2.v` + testbench |
| `Lab1_4` | Priority Encoder 4:2 | `priority_encoder_4to2.v` + 3 testbenches |
| `Lab1_5` | Barrel Shifter | `barrel_shifter.v` + testbench |
| `Lab2` | JK Flip-Flop | `jk_ff.v` + testbench |
| `Lab3_2` | Counter | `counter.v` + testbench |
| `Lab3_3` | Generic Register | `reg_generic.v` + testbench |
| `Lab3_4` | Synchronous Up Counter | `sync_up_counter.v` + testbench |
| `Lab3_5` | Asynchronous Down Counter | `async_down_counter.v` + testbench |
| `Lab3_6` | SIPO Shift Register | `sipo.v` + testbench |
| `Lab4` | Counter (FPGA) | `counter.v` + `counter.xdc` |
| `Lab4_1` | Two-Digit Counter (FPGA) | `two_digit_counter.v` + `.xdc` |
| `Lab6` | Lab 6 Design | `Lab6.v` + `mamba.xdc` |
| `Lab8_1` | Lab 8 Task 1 | `Lab8_1.v` + testbench |
| `Lab8_2` | Lab 8 Task 2 | `Lab8_2.v` + testbench |
| `Lab8_3` | Lab 8 Task 3 | `Lab8_3.v` + testbench |
| `Lab9_3` | Lab 9 Task 3 | `task3_tb.v` `task3_tb.vhd` |

### Projects

| Folder | Description | Files |
|--------|-------------|-------|
| `ALU` | Arithmetic Logic Unit | `ALU.v` + testbench |
| `CISC_Processor` | CISC Processor | `proc.v` + testbench |
| `Reg_File` | Register File | `reg_file.v` + testbench |
| `ripple_carry_adder` | Ripple Carry Adder (FPGA) | `ripple_carry_adder.v` + `.xdc` |
| `multiply4x4` | 4x4 Multiplier | `multiply4x4.v` + testbench |
| `multiply6x6` | 6x6 CSR Multiplier | `multiply6x6.v` + testbench |
| `VGA_Lab` | VGA Controller | `lab3_main.sv` `temp.v` |
| `digital_clock` | Digital Clock (FPGA) | `digital_clock.v` + `.xdc` |

### Misc

| Folder | Description | Files |
|--------|-------------|-------|
| `jk_ff` | JK Flip-Flop | `jk_ff.v` + testbench |
| `counter` | Counter | `counter.v` + testbench |
| `register` | Register | `register.v` + testbench |
| `4_bit_sync_up` | 4-bit Sync Up Counter | `4_bit_sync_up.v` + testbench |
| `bcd_fpga` | BCD on FPGA | `bcd_fpga.v` + `.xdc` |
| `bcd_seven_seg` | BCD to 7-Segment | `bcd_seven_seg.v` + `.xdc` |
| `up_counter_7seg` | Up Counter with 7-Segment (FPGA) | `up_counter_7seg.v` + `.xdc` |
| `final_practice` | Final Practice | `final_practice.v` + testbench |
| `Lab_Practice` | Lab Practice | `lab_practice.v` `clock_2.v` + testbenches |
| `OEL_Practice` | OEL Practice | `OEL.v` |

## Tools & Hardware

- **Xilinx Vivado Design Suite** — Synthesis, Simulation (XSim), Implementation, Bitstream Generation
- **HDL:** Verilog, SystemVerilog, VHDL
- **FPGA Board:** Digilent Nexys A7-100T
  - **FPGA Chip:** Xilinx Artix-7 (XC7A100T-CSG324-1)
  - **Family:** 7 Series
  - **Logic Cells:** 101,440
  - **Block RAM:** 4,860 Kb
  - **DSP Slices:** 240
  - **Clock Speed:** Up to 450 MHz
  - **Package:** CSG324 (324-pin BGA)
  - **Speed Grade:** -1
  - **Onboard Features:** 16 switches, 16 LEDs, 7-segment display, VGA, USB-UART, DDR2 memory

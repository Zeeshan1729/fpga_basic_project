# Simple Signed ALU FPGA Project

A modular signed Arithmetic Logic Unit (ALU) implemented in Verilog HDL on the Digilent Nexys A7-100T FPGA board.

---

# Features

- Signed 3-bit arithmetic
- Addition
- Subtraction
- Multiplication
- Division
- Overflow detection
- Zero flag generation
- Seven-segment display multiplexing
- Signed number display support

---

# FPGA Board

- Digilent Nexys A7-100T

---

# Tools Used

- Vivado 2025.2
- Verilog HDL

---

# Project Structure

## rtl/

Contains synthesizable Verilog modules.

### top.v
Top-level module connecting:
- ALU
- display system
- clock divider
- FPGA IO

### alu.v
Signed Arithmetic Logic Unit supporting:
- Add
- Subtract
- Multiply
- Divide

Generates:
- result
- zero flag
- overflow flag

### display_mux.v
Controls:
- seven-segment multiplexing
- sign display
- digit selection

### seven_seg.v
Seven-segment decoder module.

Converts binary values into:
- segment patterns

Supports:
- digits 0–9
- minus sign
- blank display

### clock_divider.v
Generates slower scanning signal from FPGA clock for display multiplexing.

---

## sim/

Contains simulation files.

### top_tb.v
Testbench used for:
- functional verification
- applying test vectors
- checking ALU operations

---

## constraints/

Contains FPGA constraint files.

### nexys_a7.xdc
Defines:
- FPGA pin mappings
- clock constraints
- switch mappings
- LED mappings
- seven-segment display mappings

---

## screenshots/

Contains:
- hardware implementation images
- Vivado waveform screenshots
- FPGA output demonstrations

---

## docs/

Contains project documentation and architecture notes.

### architecture.md
Explains:
- project design
- module hierarchy
- signed arithmetic handling
- display multiplexing logic

---

# Inputs

| Switches | Function |
|---|---|
| SW[15:14] | Opcode |
| SW[13:11] | Operand A |
| SW[10:8] | Operand B |

---

# Operations

| Opcode | Operation |
|---|---|
| 00 | Addition |
| 01 | Subtraction |
| 10 | Multiplication |
| 11 | Division |

---

# Outputs

## LEDs
Display:
- opcode
- operands
- result
- flags

## Seven-Segment Display
Displays:
- operand A
- operand B
- result
- sign information

Using:
- time-multiplexed scanning

---

# Notes

- Signed numbers use 2’s complement representation.
- Overflow detection is based on 3-bit signed arithmetic range.
- Display system currently shows lower display bits for large multiplication results.

---

# Author

Zeeshan Mehraj Mir


# RTL Modules

This folder contains the synthesizable Verilog HDL modules used in the signed ALU FPGA project.

## Modules

### top.v
Top-level module connecting:
- ALU
- clock divider
- display multiplexer
- seven-segment decoder
- FPGA inputs and outputs

### alu.v
Signed Arithmetic Logic Unit supporting:
- Addition
- Subtraction
- Multiplication
- Division

Also generates:
- zero flag
- overflow flag

### display_mux.v
Implements seven-segment display multiplexing.

Responsible for:
- scanning displays
- selecting active digit
- displaying signs and magnitudes

### seven_seg.v
Seven-segment decoder module.

Converts binary digit values into:
- segment control signals

Supports:
- digits 0–9
- minus sign
- blank display

### clock_divider.v
Clock divider used for:
- display scanning timing

Generates slower scan signal from:
- onboard FPGA clock

## FPGA Board
- Digilent Nexys A7-100T

## Language
- Verilog HDL

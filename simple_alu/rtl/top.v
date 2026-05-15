
module top(

    input clk,
    input [15:8] SW,

    output [6:0] seg,
    output [7:0] an,
    output [15:0] LED

);

// INPUTS

wire signed [2:0] A;
wire signed [2:0] B;

wire [1:0] opcode;
wire zero;
wire overflow;

assign opcode = SW[15:14];

assign A = SW[13:11];
assign B = SW[10:8];

// ALU

wire signed [5:0] result;

alu myalu(

    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
     .zero(zero),
    .overflow(overflow)

);

// CLOCK DIVIDER

wire [2:0] scan;

clock_divider myclock(

    .clk(clk),
    .scan(scan)

);

// DISPLAY MUX

wire [3:0] digit;

display_mux mymux(

    .scan(scan),

    .A(A),
    .B(B),
    .result(result),

    .an(an),
    .digit(digit)

);

// SEVEN SEGMENT DECODER

seven_seg mydisplay(

    .value(digit),
    .seg(seg)

);
assign LED[15:14] = opcode;
assign LED[13:11] = A;
assign LED[10:8]  = B;
assign LED[7:2]   = result;
assign LED[1]     = overflow;
assign LED[0]     = zero;

endmodule

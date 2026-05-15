`timescale 1ns / 1ps

module top_tb;

// INPUTS

reg clk;
reg [15:8] sw;


// OUTPUTS


wire [6:0] seg;
wire [7:0] an;


// DUT


top dut(

    .clk(clk),
    .sw(sw),

    .seg(seg),
    .an(an)

);

// CLOCK GENERATION


initial
begin
    clk = 0;
end

always
begin
    #5 clk = ~clk;
end

// TEST SEQUENCE


initial
begin

    // MONITOR
    

    $monitor(

        "TIME = %0t | OPCODE = %b | A = %d | B = %d | RESULT = %d",

        $time,

        sw[15:14],
        $signed(sw[13:11]),
        $signed(sw[10:8]),

        dut.result

    );

    // TEST 1 : ADD
    // 2 + 1 = 3
    

    sw[15:14] = 2'b00;
    sw[13:11] = 3'b010;
    sw[10:8]  = 3'b001;

    #100;
    // TEST 2 : SUB
    // 2 - 3 = -1
    

    sw[15:14] = 2'b01;
    sw[13:11] = 3'b010;
    sw[10:8]  = 3'b011;

    #100;

    // TEST 3 : MUL
    // -2 * 2 = -4
    

    sw[15:14] = 2'b10;
    sw[13:11] = 3'b110;
    sw[10:8]  = 3'b010;

    #100;

    // TEST 4 : DIV
    // 3 / 1 = 3
    

    sw[15:14] = 2'b11;
    sw[13:11] = 3'b011;
    sw[10:8]  = 3'b001;

    #100;

    // TEST 5 : DIV BY ZERO
    

    sw[15:14] = 2'b11;
    sw[13:11] = 3'b011;
    sw[10:8]  = 3'b000;

    #100;

    // TEST 6 : OVERFLOW
    // 3 + 3 = 6
    

    sw[15:14] = 2'b00;
    sw[13:11] = 3'b011;
    sw[10:8]  = 3'b011;

    #100;

    
    // FINISH

    $finish;

end

endmodule

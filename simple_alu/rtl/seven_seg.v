
module seven_seg(

    input [3:0] value,
    output reg [6:0] seg

);

always @(*)
begin

    case(value)

        // Numbers
        4'd0: seg = 7'b1000000;
        4'd1: seg = 7'b1111001;
        4'd2: seg = 7'b0100100;
        4'd3: seg = 7'b0110000;
        4'd4: seg = 7'b0011001;
        4'd5: seg = 7'b0010010;
        4'd6: seg = 7'b0000010;
        4'd7: seg = 7'b1111000;

        // Minus sign
        4'd10: seg = 7'b0111111;

        // Blank
        4'd15: seg = 7'b1111111;

        default: seg = 7'b1111111;

    endcase

end

endmodule

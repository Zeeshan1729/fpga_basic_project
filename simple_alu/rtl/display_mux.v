

module display_mux(

    input [2:0] scan,

    input signed [2:0] A,
    input signed [2:0] B,
    input signed [5:0] result,

    output reg [7:0] an,
    output reg [3:0] digit

);

wire [2:0] magA;
wire [2:0] magB;

wire [5:0] magR;

assign magA = (A < 0) ? -A : A;
assign magB = (B < 0) ? -B : B;
assign magR = (result < 0) ? -result : result;

always @(*)
begin

    case(scan)

        3'd0:
        begin
            an = 8'b11111110;
            digit = magR[3:0];
        end

        3'd1:
        begin
            an = 8'b11111101;

            if(result < 0)
                digit = 4'd10;
            else
                digit = 4'd15;
        end

        3'd2:
        begin
            an = 8'b11111011;
            digit = 4'd15;
        end

        3'd3:
        begin
            an = 8'b11110111;
            digit = magB;
        end

        3'd4:
        begin
            an = 8'b11101111;

            if(B < 0)
                digit = 4'd10;
            else
                digit = 4'd15;
        end

        3'd5:
        begin
            an = 8'b11011111;
            digit = 4'd15;
        end

        3'd6:
        begin
            an = 8'b10111111;
            digit = magA;
        end

        3'd7:
        begin
            an = 8'b01111111;

            if(A < 0)
                digit = 4'd10;
            else
                digit = 4'd15;
        end
        default:
        begin
            an = 8'b11111111;
               digit = 4'd15;
          end
    endcase

end

endmodule


module clock_divider(

    input clk,
    output [2:0] scan

);

reg [19:0] counter;

always @(posedge clk)
begin
    counter <= counter + 1;
end

assign scan = counter[19:17];

endmodule

module clock_div
#(
    parameter DIVIDE_BY = 17
)
(
    input reset,
    input clock,
    output reg div_clock
);
    assign NotClock = ~clock;
    wire [DIVIDE_BY - 1:0] wirelink;
   genvar i; 
    generate 
        for (i = 0; i < DIVIDE_BY; i = i + 1) 
        begin
            dFF inst(
                .D(wirelink[i]), 
                .clk(clock),
                .reset(reset),
                .Q(wirelink[i+1])
            );          
        end
    endgenerate

    assign wirelink[0] = clock;
    assign wirelink[DIVIDE_BY] = div_clock;
endmodule
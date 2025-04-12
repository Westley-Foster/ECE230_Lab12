module binary(
    input w,
    input clk,
    input reset,
    output z,
    output [2:0] leds
);
   wire [2:0] state, next;
    parameter A = 3'b000,
              B = 3'b001,
              C = 3'b010,
              D = 3'b011,
              E = 3'b100;

    dff Y0(
	    .Default(1'b0),
        .D(next[0]),
        .clk(clk),
        .Q(state[0]),
        .reset(reset)
    );

    dff Y1(
	    .Default(1'b0),
        .D(next[1]),
        .clk(clk),
        .Q(state[1]),
        .reset(reset)
    );
    dff Y2(
	    .Default(1'b0),
        .D(next[2]),
        .clk(clk),
        .Q(state[2]),
        .reset(reset)
    );

    assign z = (~state[0] & state[1]) | state[2];
    assign next[0] = (state[1] & state[2]) | (state[0] & state[2] & ~w) | (~state[0] & ~state[1] & w) | (~state[1] & ~state[2] & w) | (~state[0] & ~state[1] & ~state[2]);
    assign next[1] = (state[0] & ~state[2]) | (~state[0] & state[2]) | (~state[0] & ~state[1] & w);
    assign next[2] = (state[1] & w) | (state[0] & state[2] & w );
    assign leds = state;
endmodule
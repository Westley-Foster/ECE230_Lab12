module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

 onehot onehottop(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(led[0]),
        .leds(led[6:2])
    );

    binary binarytop(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(led[1]),
        .leds(led[9:7])
    );


endmodule
module top
#(
    parameter DIVIDE_BY = 17 // Use this when passing in to your clock div!
    // The test bench will set it appropriately for testing
)
(
    input [7:0] sw, // A and B
    input clk, // 100 MHz board clock
    input btnC, // Reset
    output [3:0] an, // 7seg anodes
    output [6:0] seg // 7seg segments
);
    wire div_clk;
    wire [3:0] A = sw[3:0];
    wire [3:0] B = sw[7:4];
    wire [3:0] AplusB, AminusB;
    
    clock_div KHz(
        .reset(btnC),
        .clock(clk),
        .div_clock(div_clk)
    );

    seven_seg_scanner scan(
        .div_clock(div_clk),
        .reset(btnC),
        .anode(an[3:0])
    );

    math_block math (
        .A(sw[3:0]),
        .B(sw[7:4]),
        .AplusB(AplusB),
        .AminusB(AminusB)
    );

    seven_seg_decoder driver (
        .A(A),
        .B(B),
        .AplusB(AplusB),
        .AminusB(AminusB),
        .anode(an[3:0]),
        .segs(seg[6:0])
    );

    // Instantiate the clock divider...
    // ... wire it up to the scanner
    // ... wire the scanner to the decoder

    // Wire up the math block into the decoder

    // Do not forget to wire up resets!!

endmodule
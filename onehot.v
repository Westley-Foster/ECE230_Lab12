module onehot(
    input w,
    input clk,
    input reset,
    output z,
    output [4:0] leds
);
    wire A, B, C, D, E;
    wire Anext, Bnext, Cnext, Dnext, Enext;

    dff A_ff (.Default(1'b1), .D(Anext), .clk(clk), .reset(reset), .Q(A));
    dff B_ff (.Default(1'b0), .D(Bnext), .clk(clk), .reset(reset), .Q(B));
    dff C_ff (.Default(1'b0), .D(Cnext), .clk(clk), .reset(reset), .Q(C));
    dff D_ff (.Default(1'b0), .D(Dnext), .clk(clk), .reset(reset), .Q(D));
    dff E_ff (.Default(1'b0), .D(Enext), .clk(clk), .reset(reset), .Q(E));

    assign Anext = 1'b0;
    assign Bnext = (~w & A) | (~w & D) | (~w & E);
    assign Cnext = (~w & B) | (~w & C);
    assign Dnext = (w & A) | (w & B) | (w & C);
    assign Enext = (w & D) | (w & E);

    assign z = C | E;
    assign leds= {E, D, C, B, A};
endmodule

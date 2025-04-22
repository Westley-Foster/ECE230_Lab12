module seven_seg_scanner(
    input div_clock,
    input reset,
    output reg [3:0] anode
);
    reg [1:0] state;


    dFF inst2(
                .D(state[0]), 
                .clk(div_clock),
                .reset(reset),
                .Q(state[1])
            );          

    
   // Use the D FlipFlops from previous labs, and implement all other logic
    // purely combinatorial.
       always @(*) begin
        case (state)
            2'd00: anode[3:0] = 4'b1110; // Right
            2'd01: anode[3:0] = 4'b1101; // Right Center
            2'd10: anode[3:0] = 4'b1011; // Left Center
            2'd11: anode[3:0] = 4'b0111; // Left
        endcase
    end
    


endmodule
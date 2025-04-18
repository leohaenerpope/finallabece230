module seven_seg_scanner(
    input div_clock,
    input reset,
    output [3:0] anode
);

    wire Anext, Bnext, Cnext, Dnext;
    wire Astate, Bstate, Cstate, Dstate;
    
    dff Adff(
        .Default(1'b1),
        .D(Anext),
        .clk(clk),
        .Q(Astate),
        .reset(reset)
    );
    
    dff Bdff(
        .Default(1'b0),
        .D(Bnext),
        .clk(clk),
        .Q(Bstate),
        .reset(reset)
    );
    
    dff Cdff(
        .Default(1'b0),
        .D(Cnext),
        .clk(clk),
        .Q(Cstate),
        .reset(reset)
    );
    
    dff Ddff(
        .Default(1'b0),
        .D(Dnext),
        .clk(clk),
        .Q(Dstate),
        .reset(reset)
    );
    
    assign Anext = div_clock & Dstate;
    assign Bnext = div_clock & Astate;
    assign Cnext = div_clock & Bstate;
    assign Dnext = div_clock & Cstate;
    
    assign anode = {~Dstate, ~Cstate, ~Bstate, ~Astate};
    
    

endmodule
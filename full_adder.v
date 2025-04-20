module full_adder(
    input A, B, Cin,
    output Y, Cout
);
    assign Y = A ^ B ^ Cin;
    assign Cout = Cin & A | Cin & B | A & B;

endmodule
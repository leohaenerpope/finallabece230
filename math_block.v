module math_block(
    input [3:0] A,
    input [3:0] B,
    output [3:0] AplusB,
    output [3:0] AminusB
);
    wire [2:0] carry;
    full_adder fadd0(
        .A(A[0]),
        .B(B[0]),
        .Y(AplusB[0]),
        .Cin(1'b0),
        .Cout(carry[0])
    ); 
    full_adder fadd1(
        .A(A[1]),
        .B(B[1]),
        .Y(AplusB[1]),
        .Cin(carry[0]),
        .Cout(carry[1])
    );
    full_adder fadd2(
        .A(A[2]),
        .B(B[2]),
        .Y(AplusB[2]),
        .Cin(carry[1]),
        .Cout(carry[2])
    );
    full_adder fadd3(
        .A(A[3]),
        .B(B[3]),
        .Y(AplusB[3]),
        .Cin(carry[2]),
        .Cout()
    ); 
    
    wire [3:0] twoB;
    twos_compliment twosB(
        .A(B),
        .Y(twoB)
    );
    
    full_adder fadd4(
        .A(A[0]),
        .B(twoB[0]),
        .Y(AminusB[0]),
        .Cin(1'b0),
        .Cout(carry[0])
    ); 
    full_adder fadd5(
        .A(A[1]),
        .B(twoB[1]),
        .Y(AminusB[1]),
        .Cin(carry[0]),
        .Cout(carry[1])
    );
    full_adder fadd6(
        .A(A[2]),
        .B(twoB[2]),
        .Y(AminusB[2]),
        .Cin(carry[1]),
        .Cout(carry[2])
    );
    full_adder fadd7(
        .A(A[3]),
        .B(twoB[3]),
        .Y(AminusB[3]),
        .Cin(carry[2]),
        .Cout()
    ); 
endmodule

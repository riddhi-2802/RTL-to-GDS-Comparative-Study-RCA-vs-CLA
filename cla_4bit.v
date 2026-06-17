module cla_4bit(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

wire [3:0] G, P;
wire c1, c2, c3;

// Generate and Propagate
assign G = A & B;
assign P = A ^ B;

// Carry equations
assign c1 = G[0] | (P[0] & Cin);
assign c2 = G[1] | (P[1] & c1);
assign c3 = G[2] | (P[2] & c2);
assign Cout = G[3] | (P[3] & c3);

// Sum equations
assign Sum[0] = P[0] ^ Cin;
assign Sum[1] = P[1] ^ c1;
assign Sum[2] = P[2] ^ c2;
assign Sum[3] = P[3] ^ c3;

endmodule
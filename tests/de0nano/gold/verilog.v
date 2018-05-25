module Add (input  A, input  B, output  C);
C = A ^ B;
endmodule

module main (input  B2, input  B1, output  D1);
wire  inst0_C;
Add inst0 (.A(B1), .B(B2), .C(inst0_C));
assign D1 = inst0_C;
endmodule


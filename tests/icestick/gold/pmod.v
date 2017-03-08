module main (input [3:0] PMOD0, output  D4, output  D3, output  D2, output  D1);
assign D4 = PMOD0[3];
assign D3 = PMOD0[2];
assign D2 = PMOD0[1];
assign D1 = PMOD0[0];
endmodule


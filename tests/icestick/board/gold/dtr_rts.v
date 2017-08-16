module main (output  D2, output  D1, input  DTR, input  RTS);
assign D2 = RTS;
assign D1 = DTR;
endmodule


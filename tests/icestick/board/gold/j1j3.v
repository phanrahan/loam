module main (input [7:0] J1, output [7:0] J3);
assign J3 = {J1[0],J1[1],J1[2],J1[3],J1[4],J1[5],J1[6],J1[7]};
endmodule


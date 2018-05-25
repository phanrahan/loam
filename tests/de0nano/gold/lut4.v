module _LUT4 (input  I0, input  I1, input  I2, input  I3, output  O);
wire aw,bw,cw,dw;
lut_input lut_in1 (I0, aw) ;
lut_input lut_in2 (I1, bw) ;
lut_input lut_in3 (I2, cw) ;
lut_input lut_in4 (I3, dw) ;
lut_output lut_o (aw & bw & cw & dw, O) ;
endmodule

module main (input  B2, input  B1, output  D1);
wire  inst0_O;
_LUT4 inst0 (.I0(B1), .I1(B2), .I2(B1), .I3(B2), .O(inst0_O));
assign D1 = inst0_O;
endmodule


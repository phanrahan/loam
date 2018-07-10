module NOr3 (input [2:0] I, output  O);
wire  inst0_O;
LUT3 #(.INIT(8'h01)) inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .O(inst0_O));
assign O = inst0_O;
endmodule

module NOr3x2 (input [1:0] I0, input [1:0] I1, input [1:0] I2, output [1:0] O);
wire  inst0_O;
wire  inst1_O;
NOr3 inst0 (.I({I2[0],I1[0],I0[0]}), .O(inst0_O));
NOr3 inst1 (.I({I2[1],I1[1],I0[1]}), .O(inst1_O));
assign O = {inst1_O,inst0_O};
endmodule

module main (output [1:0] LED, input [5:0] SWITCH);
wire [1:0] inst0_O;
NOr3x2 inst0 (.I0({SWITCH[1],SWITCH[0]}), .I1({SWITCH[3],SWITCH[2]}), .I2({SWITCH[5],SWITCH[4]}), .O(inst0_O));
assign LED = inst0_O;
endmodule


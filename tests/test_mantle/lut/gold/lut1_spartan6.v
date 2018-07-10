module main (output  LED, input  SWITCH);
wire  inst0_O;
LUT1 #(.INIT(2'h2)) inst0 (.I0(SWITCH), .O(inst0_O));
assign LED = inst0_O;
endmodule


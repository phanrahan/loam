module main (output  LED, input  SWITCH, input  CLKIN);
wire  inst0_CLKFX;
wire  inst1_O;
wire  inst2_Q;
DCM #(.STARTUP_WAIT("FALSE"),
.DUTY_CYCLE_CORRECTION("FALSE"),
.CLKFX_MULTIPLY(2),
.CLK_FEEDBACK("NONE"),
.CLKFX_DIVIDE(1)) inst0 (.CLKIN(CLKIN), .CLKFB(1'b0), .PSCLK(1'b0), .PSEN(1'b0), .PSINCDEC(1'b0), .RST(1'b0), .CLKFX(inst0_CLKFX));
BUFG inst1 (.I(inst0_CLKFX), .O(inst1_O));
FDRSE #(.INIT(1'h0)) inst2 (.C(inst1_O), .CE(1'b1), .R(1'b0), .S(1'b0), .D(SWITCH), .Q(inst2_Q));
assign LED = inst2_Q;
endmodule


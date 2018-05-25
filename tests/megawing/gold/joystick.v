module main (output [4:0] LED, input  SELECT, input  UP, input  DOWN, input  LEFT, input  RIGHT);
assign LED = {RIGHT,LEFT,DOWN,UP,SELECT};
endmodule


module main (output [4:0] LED, input  RIGHT, input  LEFT, input  DOWN, input  UP, input  SELECT);
assign LED = {RIGHT,LEFT,DOWN,UP,SELECT};
endmodule


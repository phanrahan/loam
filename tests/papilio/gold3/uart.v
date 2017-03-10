module FIFO (input [7:0] data_in, output [7:0] data_out, input  reset, input  write, input  read, output  full, output  half_full, output  data_present, input  CLK);

////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2004 Xilinx, Inc.
// All Rights Reserved
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: 1.01
//  \   \         Filename: bbfifo_16x8.v
//  /   /         Date Last Modified:  08/04/2004
// /___/   /\     Date Created: 10/14/2002
// \   \  /  //  \___\/\___//
//Device:  	Xilinx
//Purpose: 	
// 	'Bucket Brigade' FIFO
// 	16 deep
// 	8-bit data
//Reference:
// 	None
//Revision History:
//    Rev 1.00 - kc - Start of design entry in VHDL,  10/14/2002.
//    Rev 1.01 - sus - Converted to verilog,  08/04/2004.
//    Rev 1.02 - njs - Synplicity attributes added,  09/06/2004.
//    Rev 1.03 - njs - defparam values corrected,  12/01/2005.
////////////////////////////////////////////////////////////////////////////////
// Contact: e-mail  picoblaze@xilinx.com
//////////////////////////////////////////////////////////////////////////////////
//
// Disclaimer: 
// LIMITED WARRANTY AND DISCLAIMER. These designs are
// provided to you "as is". Xilinx and its licensors make and you
// receive no warranties or conditions, express, implied,
// statutory or otherwise, and Xilinx specifically disclaims any
// implied warranties of merchantability, non-infringement, or
// fitness for a particular purpose. Xilinx does not warrant that
// the functions contained in these designs will meet your
// requirements, or that the operation of these designs will be
// uninterrupted or error free, or that defects in the Designs
// will be corrected. Furthermore, Xilinx does not warrant or
// make any representations regarding use or the results of the
// use of the designs in terms of correctness, accuracy,
// reliability, or otherwise.
//
// LIMITATION OF LIABILITY. In no event will Xilinx or its
// licensors be liable for any loss of data, lost profits, cost
// or procurement of substitute goods or services, or for any
// special, incidental, consequential, or indirect damages
// arising from the use or operation of the designs or
// accompanying documentation, however caused and on any theory
// of liability. This limitation will apply even if Xilinx
// has been advised of the possibility of such damage. This
// limitation shall apply not-withstanding the failure of the 
// essential purpose of any limited remedies herein. 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1ps

//module bbfifo_16x8
//       (data_in,
//   	data_out,
//   	reset,
//   	write,
//   	read,
//   	full,
//		half_full,
//	   data_present,
//      clk);

//input 	[7:0] 	data_in;
//output 	[7:0] 	data_out;
//input 		reset;
//input 		write; 
//input 		read;
//output 		full;
//output 		half_full;
//output 		data_present;
//input 		clk;

////////////////////////////////////////////////////////////////////////////////////
//
// Start of BBFIFO_16x8
//	 
//
////////////////////////////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////////////////////////////
//
// wires used in BBFIFO_16x8
//
////////////////////////////////////////////////////////////////////////////////////

wire [3:0] 	pointer;
wire [3:0] 	next_count;
wire [3:0] 	half_count;
wire [2:0] 	count_carry;

wire 		pointer_zero;
wire 		pointer_full;
wire 		decode_data_present;
wire 		data_present_int;
wire 		valid_write;

////////////////////////////////////////////////////////////////////////////////////
//
// Attributes to define LUT contents during implementation 
// The information is repeated in the defparams for functional simulation//
//
////////////////////////////////////////////////////////////////////////////////////


// synthesis attribute init of zero_lut is "0001"; 
// synthesis attribute init of full_lut is "8000"; 
// synthesis attribute init of dp_lut is "BFA0"; 
// synthesis attribute init of valid_lut is "C4"; 
// synthesis attribute init of data_srl_0 is "0000"; 
// synthesis attribute init of data_srl_1 is "0000"; 
// synthesis attribute init of data_srl_2 is "0000"; 
// synthesis attribute init of data_srl_3 is "0000"; 
// synthesis attribute init of data_srl_4 is "0000"; 
// synthesis attribute init of data_srl_5 is "0000"; 
// synthesis attribute init of data_srl_6 is "0000"; 
// synthesis attribute init of data_srl_7 is "0000"; 
// synthesis attribute init of count_lut_0 is "6606";
// synthesis attribute init of count_lut_1 is "6606";
// synthesis attribute init of count_lut_2 is "6606";
// synthesis attribute init of count_lut_3 is "6606";

////////////////////////////////////////////////////////////////////////////////////
//
// Start of BBFIFO_16x8 circuit description
//
////////////////////////////////////////////////////////////////////////////////////
	
// SRL16E data storage
     SRL16E data_srl_0 
     (   	.D(data_in[0]),
            .CE(valid_write),
            .CLK(CLK),
            .A0(pointer[0]),
            .A1(pointer[1]),
            .A2(pointer[2]),
            .A3(pointer[3]),
            .Q(data_out[0]) )/* synthesis xc_props = "INIT=0000"*/; 
	// synthesis translate_off
	defparam data_srl_0.INIT = 16'h0000; 
	// synthesis translate_on

     SRL16E data_srl_1 
     (   	.D(data_in[1]),
            .CE(valid_write),
            .CLK(CLK),
            .A0(pointer[0]),
            .A1(pointer[1]),
            .A2(pointer[2]),
            .A3(pointer[3]),
            .Q(data_out[1]) )/* synthesis xc_props = "INIT=0000"*/; 
	// synthesis translate_off
	defparam data_srl_1.INIT = 16'h0000; 
	// synthesis translate_on

     SRL16E data_srl_2 
     (   	.D(data_in[2]),
            .CE(valid_write),
            .CLK(CLK),
            .A0(pointer[0]),
            .A1(pointer[1]),
            .A2(pointer[2]),
            .A3(pointer[3]),
            .Q(data_out[2]) )/* synthesis xc_props = "INIT=0000"*/; 
	// synthesis translate_off
	defparam data_srl_2.INIT = 16'h0000; 
	// synthesis translate_on

     SRL16E data_srl_3 
     (   	.D(data_in[3]),
            .CE(valid_write),
            .CLK(CLK),
            .A0(pointer[0]),
            .A1(pointer[1]),
            .A2(pointer[2]),
            .A3(pointer[3]),
            .Q(data_out[3]) )/* synthesis xc_props = "INIT=0000"*/; 
	// synthesis translate_off
	defparam data_srl_3.INIT = 16'h0000; 
	// synthesis translate_on

     SRL16E data_srl_4 
     (   	.D(data_in[4]),
            .CE(valid_write),
            .CLK(CLK),
            .A0(pointer[0]),
            .A1(pointer[1]),
            .A2(pointer[2]),
            .A3(pointer[3]),
            .Q(data_out[4]) )/* synthesis xc_props = "INIT=0000"*/; 
	// synthesis translate_off
	defparam data_srl_4.INIT = 16'h0000; 
	// synthesis translate_on

     SRL16E data_srl_5 
     (   	.D(data_in[5]),
            .CE(valid_write),
            .CLK(CLK),
            .A0(pointer[0]),
            .A1(pointer[1]),
            .A2(pointer[2]),
            .A3(pointer[3]),
            .Q(data_out[5]) )/* synthesis xc_props = "INIT=0000"*/; 
	// synthesis translate_off
	defparam data_srl_5.INIT = 16'h0000; 
	// synthesis translate_on

     SRL16E data_srl_6
     (   	.D(data_in[6]),
            .CE(valid_write),
            .CLK(CLK),
            .A0(pointer[0]),
            .A1(pointer[1]),
            .A2(pointer[2]),
            .A3(pointer[3]),
            .Q(data_out[6]) )/* synthesis xc_props = "INIT=0000"*/; 
	// synthesis translate_off
	defparam data_srl_6.INIT = 16'h0000; 
	// synthesis translate_on

     SRL16E data_srl_7 
     (   	.D(data_in[7]),
            .CE(valid_write),
            .CLK(CLK),
            .A0(pointer[0]),
            .A1(pointer[1]),
            .A2(pointer[2]),
            .A3(pointer[3]),
            .Q(data_out[7]) )/* synthesis xc_props = "INIT=0000"*/; 
	// synthesis translate_off
	defparam data_srl_7.INIT = 16'h0000; 
	// synthesis translate_on

  // 4-bit counter to act as data pointer
  // Counter is clock enabled by 'data_present'
  // Counter will be reset when 'reset' is active
  // Counter will increment when 'valid_write' is active

     FDRE register_bit_0
     ( 	.D(next_count[0]),
            .Q(pointer[0]),
            .CE(data_present_int),
            .R(reset),
            .C(CLK) );

     LUT4 count_lut_0
     ( 	.I0(pointer[0]),
            .I1(read),
            .I2(pointer_zero),
            .I3(write),
            .O(half_count[0]) )/* synthesis xc_props = "INIT=6606"*/;
	// synthesis translate_off
	defparam count_lut_0.INIT = 16'h6606; 
	// synthesis translate_on

     FDRE register_bit_1
     ( 	.D(next_count[1]),
            .Q(pointer[1]),
            .CE(data_present_int),
            .R(reset),
            .C(CLK) );

     LUT4 count_lut_1
     ( 	.I0(pointer[1]),
            .I1(read),
            .I2(pointer_zero),
            .I3(write),
            .O(half_count[1]) )/* synthesis xc_props = "INIT=6606"*/;
	// synthesis translate_off
	defparam count_lut_1.INIT = 16'h6606; 
	// synthesis translate_on

     FDRE register_bit_2
     ( 	.D(next_count[2]),
            .Q(pointer[2]),
            .CE(data_present_int),
            .R(reset),
            .C(CLK) );

     LUT4 count_lut_2
     ( 	.I0(pointer[2]),
            .I1(read),
            .I2(pointer_zero),
            .I3(write),
            .O(half_count[2]) )/* synthesis xc_props = "INIT=6606"*/;
	// synthesis translate_off
	defparam count_lut_2.INIT = 16'h6606; 
	// synthesis translate_on

     FDRE register_bit_3
     ( 	.D(next_count[3]),
            .Q(pointer[3]),
            .CE(data_present_int),
            .R(reset),
            .C(CLK) );

     LUT4 count_lut_3
     ( 	.I0(pointer[3]),
            .I1(read),
            .I2(pointer_zero),
            .I3(write),
            .O(half_count[3]) )/* synthesis xc_props = "INIT=6606"*/;
	// synthesis translate_off
	defparam count_lut_3.INIT = 16'h6606; 
	// synthesis translate_on

     	MUXCY count_muxcy_0
      ( 	.DI(pointer[0]),
            .CI(valid_write),
            .S(half_count[0]),
            .O(count_carry[0]) );
       
     	XORCY count_xor_0
      ( 	.LI(half_count[0]),
            .CI(valid_write),
            .O(next_count[0]) );

      MUXCY count_muxcy_1 
      ( 	.DI(pointer[1]),
            .CI(count_carry[0]),
            .S(half_count[1]),
            .O(count_carry[1]) );
       
      XORCY count_xor_1
      ( 	.LI(half_count[1]),
            .CI(count_carry[0]),
            .O(next_count[1]) );

	MUXCY count_muxcy_2 
      ( 	.DI(pointer[2]),
            .CI(count_carry[1]),
            .S(half_count[2]),
            .O(count_carry[2]) );
       
      XORCY count_xor_2
      ( 	.LI(half_count[2]),
            .CI(count_carry[1]),
            .O(next_count[2]) );

      XORCY count_xor
      ( 	.LI(half_count[3]),
            .CI(count_carry[2]),
            .O(next_count[3]) );

  // Detect when pointer is zero and maximum

  	LUT4 zero_lut
	( 	.I0(pointer[0]),
            .I1(pointer[1]),
            .I2(pointer[2]),
            .I3(pointer[3]),
            .O(pointer_zero ) )/* synthesis xc_props = "INIT=0001"*/;
	// synthesis translate_off
	defparam zero_lut.INIT = 16'h0001; 
	// synthesis translate_on

  	LUT4 full_lut
	( 	.I0(pointer[0]),
            .I1(pointer[1]),
            .I2(pointer[2]),
            .I3(pointer[3]),
            .O(pointer_full ) )/* synthesis xc_props = "INIT=8000"*/;
	// synthesis translate_off
	defparam full_lut.INIT = 16'h8000; 
	// synthesis translate_on

  // Data Present status

  	LUT4 dp_lut
  	( 	.I0(write),
            .I1(read),
            .I2(pointer_zero),
            .I3(data_present_int),
            .O(decode_data_present ) )/* synthesis xc_props = "INIT=BFA0"*/;
	// synthesis translate_off
	defparam dp_lut.INIT = 16'hBFA0; 
	// synthesis translate_on

	FDR dp_flop
	( 	.D(decode_data_present),
            .Q(data_present_int),
            .R(reset),
            .C(CLK) );

  // Valid write wire

  	LUT3 valid_lut
  	( 	.I0(pointer_full),
            .I1(write),
            .I2(read),
            .O(valid_write ) )/* synthesis xc_props = "INIT=C4"*/;
	// synthesis translate_off
	defparam valid_lut.INIT = 8'hC4; 
	// synthesis translate_on

  // assign internal wires to outputs

  	assign full = pointer_full;  
	assign half_full = pointer[3];  
  	assign data_present = data_present_int;	 

//endmodule

endmodule

module UARTTX (input [7:0] data_in, input  send_character, input  en_16_x_baud, output  serial_out, output  Tx_complete, input  CLK);

//module kcuart_tx
//     (data_in,
//      send_character,
//      en_16_x_baud,
//      serial_out,
//      Tx_complete,
//      clk);

//input 	[7:0]	data_in;
//input       	send_character;
//input       	en_16_x_baud;
//output		serial_out;
//output		Tx_complete;
//input 		clk;

//
////////////////////////////////////////////////////////////////////////////////////
//
// Start of KCUART_TX
//	 
//
////////////////////////////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////////////////////////////
//
// wires used in KCUART_TX
//
////////////////////////////////////////////////////////////////////////////////////
//
wire 		data_01;
wire 		data_23;
wire 		data_45;
wire 		data_67;
wire 		data_0123;
wire 		data_4567;
wire 		data_01234567;
wire 	[2:0] 	bit_select;
wire 	[2:0] 	next_count;
wire 	[2:0] 	mask_count;
wire 	[2:0] 	mask_count_carry;
wire 	[2:0] 	count_carry;
wire 		ready_to_start;
wire 		decode_Tx_start;
wire 		Tx_start;
wire 		decode_Tx_run;
wire 		Tx_run;
wire 		decode_hot_state;
wire 		hot_state;
wire 		hot_delay;
wire 		Tx_bit;
wire 		decode_Tx_stop;
wire 		Tx_stop;
wire 		decode_Tx_complete;
//
//
////////////////////////////////////////////////////////////////////////////////////
//
// Attributes to define LUT contents during implementation 
// The information is repeated in the generic map for functional simulation//
//
////////////////////////////////////////////////////////////////////////////////////

// synthesis attribute init of mux1_lut is "E4FF"; 
// synthesis attribute init of mux2_lut is "E4FF";
// synthesis attribute init of mux3_lut is "E4FF";
// synthesis attribute init of mux4_lut is "E4FF";
// synthesis attribute init of ready_lut is "10";
// synthesis attribute init of start_lut is "0190";
// synthesis attribute init of run_lut is "1540";
// synthesis attribute init of hot_state_lut is "94";
// synthesis attribute init of delay14_srl is "0000";
// synthesis attribute init of stop_lut is "0180";
// synthesis attribute init of complete_lut is "8";
// synthesis attribute init of count_lut_0 is "8";
// synthesis attribute init of count_lut_1 is "8";
// synthesis attribute init of count_lut_2 is "8";

//
////////////////////////////////////////////////////////////////////////////////////
//
// Start of KCUART_TX circuit description
//
////////////////////////////////////////////////////////////////////////////////////
//	

  // 8 to 1 multiplexer to convert parallel data to serial

        // O = (bit_select ? data_in[1] : data_in[0]) | !tx_run
  	LUT4 mux1_lut
  	  ( .I0(bit_select[0]),
   	    .I1(data_in[0]),
            .I2(data_in[1]),
            .I3(Tx_run),
            .O(data_01) )/* synthesis xc_props = "INIT=E4FF"*/;
	// synthesis translate_off
	defparam mux1_lut.INIT = 16'hE4FF; 
	// synthesis translate_on

  	LUT4 mux2_lut 
  	(   .I0(bit_select[0]),
            .I1(data_in[2]),
            .I2(data_in[3]),
            .I3(Tx_run),
            .O(data_23) )/* synthesis xc_props = "INIT=E4FF"*/;
	// synthesis translate_off
	defparam mux2_lut.INIT = 16'hE4FF; 
	// synthesis translate_on

  	LUT4 mux3_lut
  	   (.I0(bit_select[0]),
            .I1(data_in[4]),
            .I2(data_in[5]),
            .I3(Tx_run),
            .O(data_45) )/* synthesis xc_props = "INIT=E4FF"*/;
	// synthesis translate_off
	defparam mux3_lut.INIT = 16'hE4FF; 
	// synthesis translate_on

  	LUT4 mux4_lut
  	   (.I0(bit_select[0]),
            .I1(data_in[6]),
            .I2(data_in[7]),
            .I3(Tx_run),
            .O(data_67) )/* synthesis xc_props = "INIT=E4FF"*/;
	// synthesis translate_off
	defparam mux4_lut.INIT = 16'hE4FF; 
	// synthesis translate_on

  	MUXF5 mux5_muxf5
  		(		.I1(data_23),
            .I0(data_01),
            .S(bit_select[1]),
            .O(data_0123) );

  	MUXF5 mux6_muxf5
  		( 		.I1(data_67),
            .I0(data_45),
            .S(bit_select[1]),
            .O(data_4567) );

  	MUXF6 mux7_muxf6
  		(		.I1(data_4567),
            .I0(data_0123),
            .S(bit_select[2]),
            .O(data_01234567) );

  // Register serial output and force start and stop bits

  	FDRS pipeline_serial
   	(   .D(data_01234567),
            .Q(serial_out),
            .R(Tx_start),
            .S(Tx_stop),
            .C(CLK) ) ;

  // 3-bit counter
  // Counter is clock enabled by en_16_x_baud
  // Counter will be reset when 'Tx_start' is active
  // Counter will increment when Tx_bit is active
  // Tx_run must be active to count
  // count_carry[2] indicates when terminal count [7] is reached and Tx_bit=1 (ie overflow)

	FDRE register_bit_0
   	(.D(next_count[0]),
         .Q(bit_select[0]),
         .CE(en_16_x_baud),
         .R(Tx_start),
         .C(CLK) );

        // O = bit_select & tx_run
	LUT2 count_lut_0
     	(.I0(bit_select[0]),
         .I1(Tx_run),
         .O(mask_count[0]) )/* synthesis xc_props = "INIT=8"*/;
	// synthesis translate_off
	defparam count_lut_0.INIT = 4'h8; 					 
	// synthesis translate_on

   MULT_AND mask_and_0
   	(.I0(bit_select[0]),
       	 .I1(Tx_run),
         .LO(mask_count_carry[0]) );

	MUXCY count_muxcy_0
   	( .DI(mask_count_carry[0]),
         .CI(Tx_bit),
         .S(mask_count[0]),
         .O(count_carry[0]) );
       
	XORCY count_xor_0
   	(.LI(mask_count[0]),
         .CI(Tx_bit),
         .O(next_count[0]) );
 
	FDRE register_bit_1
     	(.D(next_count[1]),
         .Q(bit_select[1]),
         .CE(en_16_x_baud),
         .R(Tx_start),
         .C(CLK) );

	LUT2 count_lut_1
     	(.I0(bit_select[1]),
         .I1(Tx_run),
         .O(mask_count[1]) )/* synthesis xc_props = "INIT=8"*/;
	// synthesis translate_off
	defparam count_lut_1.INIT = 4'h8; 					 
	// synthesis translate_on

   MULT_AND mask_and_1
     	( 	.I0(bit_select[1]),
         .I1(Tx_run),
         .LO(mask_count_carry[1]) );

	MUXCY count_muxcy_1
   	( 	.DI(mask_count_carry[1]),
         .CI(count_carry[0]),
         .S(mask_count[1]),
         .O(count_carry[1]) );
       
	XORCY count_xor_1
     	( 	.LI(mask_count[1]),
         .CI(count_carry[0]),
         .O(next_count[1]) );

	FDRE register_bit_2
     	( 	.D(next_count[2]),
         .Q(bit_select[2]),
         .CE(en_16_x_baud),
         .R(Tx_start),
         .C(CLK) );

  	LUT2 count_lut_2
   	( 	.I0(bit_select[2]),
         .I1(Tx_run),
         .O(mask_count[2]) )/* synthesis xc_props = "INIT=8"*/;
	// synthesis translate_off
	defparam count_lut_2.INIT = 4'h8; 					 
	// synthesis translate_on
	
	MULT_AND mask_and_2
     	( 	.I0(bit_select[2]),
         .I1(Tx_run),
         .LO(mask_count_carry[2]) );


	MUXCY count_muxcy_2
   	( 	.DI(mask_count_carry[2]),
         .CI(count_carry[1]),
         .S(mask_count[2]) ,
         .O(count_carry[2]) );
       
	XORCY count_xor_2
		( 	.LI(mask_count[2]),
         .CI(count_carry[1]),
         .O(next_count[2]) );

  // Ready to start decode

        // ready = stop & send
  	LUT3 ready_lut
  		( 	.I0(Tx_run),
         .I1(Tx_start),
         .I2(send_character),
         .O(ready_to_start ) )/* synthesis xc_props = "INIT=10"*/;
	// synthesis translate_off
	defparam ready_lut.INIT = 8'h10; 
	// synthesis translate_on

  // Start bit enable

        // start = ready
  	LUT4 start_lut
  		( 	.I0(Tx_bit),
         .I1(Tx_stop),
         .I2(ready_to_start),
         .I3(Tx_start),
         .O(decode_Tx_start ) )/* synthesis xc_props = "INIT=0190"*/;
	// synthesis translate_off
	defparam start_lut.INIT = 16'h0190; 
	// synthesis translate_on

  	FDE Tx_start_reg
  	(	.D(decode_Tx_start),
      .Q(Tx_start),
      .CE(en_16_x_baud),
      .C(CLK) );


  // Run bit enable
       // run = start | (run & !carry)
  	LUT4 run_lut
  	( 	.I0(count_carry[2]),
      .I1(Tx_bit),
      .I2(Tx_start),
      .I3(Tx_run),
		.O(decode_Tx_run ) )/* synthesis xc_props = "INIT=1540"*/;
	// synthesis translate_off
	defparam run_lut.INIT = 16'h1540; 
	// synthesis translate_on

  	FDE Tx_run_reg
  	(	.D(decode_Tx_run),
      .Q(Tx_run),
      .CE(en_16_x_baud),
      .C(CLK) );

  // Bit rate enable

      // hot = ready | bit
  	LUT3 hot_state_lut
  	(	.I0(Tx_stop),
      .I1(ready_to_start),
      .I2(Tx_bit),
      .O(decode_hot_state) )/* synthesis xc_props = "INIT=94"*/;
	// synthesis translate_off
	defparam hot_state_lut.INIT = 8'h94; 
	// synthesis translate_on

  	FDE hot_state_reg
  	(	.D(decode_hot_state),
      .Q(hot_state),
      .CE(en_16_x_baud),
      .C(CLK) );

  	SRL16E delay14_srl
  	(	.D(hot_state),
      .CE(en_16_x_baud),
      .CLK(CLK),
      .A0(1'b1),
      .A1(1'b0),
      .A2(1'b1),
      .A3(1'b1),
      .Q(hot_delay) )/* synthesis xc_props = "INIT=0000"*/;
	// synthesis translate_off
	defparam delay14_srl.INIT = 16'h0000; 
	// synthesis translate_on

  	FDE Tx_bit_reg
  	(	.D(hot_delay),
     	.Q(Tx_bit),
      .CE(en_16_x_baud),
      .C(CLK) );

  // Stop bit enable
       // stop = (run & carry) | (stop & !send)
  	LUT4 stop_lut
  	(	.I0(Tx_bit),
      .I1(Tx_run),
      .I2(count_carry[2]),
      .I3(Tx_stop),	  
      .O(decode_Tx_stop) )/* synthesis xc_props = "INIT=0180"*/;
	// synthesis translate_off
	defparam stop_lut.INIT = 16'h0180; 
	// synthesis translate_on

  FDE Tx_stop_reg
  ( 	    .D(decode_Tx_stop),
            .Q(Tx_stop),
            .CE(en_16_x_baud),
            .C(CLK) );

  // Tx_complete strobe

  // complete = carry & baud
  LUT2 complete_lut
  ( 	    .I0(count_carry[2]),
            .I1(en_16_x_baud),
            .O(decode_Tx_complete) )/* synthesis xc_props = "INIT=8"*/;
	// synthesis translate_off
	defparam complete_lut.INIT = 4'h8; 
	// synthesis translate_on

  FD Tx_complete_reg
  ( 	     .D(decode_Tx_complete),
             .Q(Tx_complete),
             .C(CLK) );


//endmodule

endmodule

module main (input  CLKIN, output  TX);
wire  inst0_Q;
wire  inst0_Q15;
wire  inst1_Q;
wire  inst1_Q15;
wire  inst2_O;
wire  inst3_O;
wire  inst4_Q;
wire  inst4_Q15;
wire  inst5_Q;
wire  inst5_Q15;
wire  inst6_O;
wire  inst7_O;
wire  inst8_Q;
wire  inst8_Q15;
wire  inst9_Q;
wire  inst9_Q15;
wire  inst10_O;
wire  inst11_O;
wire [7:0] inst12_data_out;
wire  inst12_full;
wire  inst12_half_full;
wire  inst12_data_present;
wire  inst13_serial_out;
wire  inst13_Tx_complete;
SRLC16E #(.INIT(16'h0001)) inst0 (.A0(1'b1), .A1(1'b0), .A2(1'b1), .A3(1'b1), .D(inst2_O), .Q(inst0_Q), .Q15(inst0_Q15), .CE(1'b1), .CLK(CLKIN));
SRLC16E #(.INIT(16'h0000)) inst1 (.A0(1'b1), .A1(1'b0), .A2(1'b1), .A3(1'b1), .D(inst0_Q15), .Q(inst1_Q), .Q15(inst1_Q15), .CE(1'b1), .CLK(CLKIN));
MUXF5 inst2 (.I0(inst0_Q), .I1(inst1_Q), .S(1'b0), .O(inst2_O));
LUT2 #(.INIT(4'h8)) inst3 (.I0(1'b1), .I1(inst2_O), .O(inst3_O));
SRLC16E #(.INIT(16'h0001)) inst4 (.A0(1'b1), .A1(1'b0), .A2(1'b1), .A3(1'b1), .D(inst6_O), .Q(inst4_Q), .Q15(inst4_Q15), .CE(inst3_O), .CLK(CLKIN));
SRLC16E #(.INIT(16'h0000)) inst5 (.A0(1'b1), .A1(1'b0), .A2(1'b1), .A3(1'b1), .D(inst4_Q15), .Q(inst5_Q), .Q15(inst5_Q15), .CE(inst3_O), .CLK(CLKIN));
MUXF5 inst6 (.I0(inst4_Q), .I1(inst5_Q), .S(1'b0), .O(inst6_O));
LUT2 #(.INIT(4'h8)) inst7 (.I0(inst3_O), .I1(inst6_O), .O(inst7_O));
SRLC16E #(.INIT(16'h0001)) inst8 (.A0(1'b0), .A1(1'b0), .A2(1'b0), .A3(1'b0), .D(inst10_O), .Q(inst8_Q), .Q15(inst8_Q15), .CE(inst7_O), .CLK(CLKIN));
SRLC16E #(.INIT(16'h0000)) inst9 (.A0(1'b0), .A1(1'b0), .A2(1'b0), .A3(1'b0), .D(inst8_Q15), .Q(inst9_Q), .Q15(inst9_Q15), .CE(inst7_O), .CLK(CLKIN));
MUXF5 inst10 (.I0(inst8_Q), .I1(inst9_Q), .S(1'b1), .O(inst10_O));
LUT2 #(.INIT(4'h8)) inst11 (.I0(inst7_O), .I1(inst10_O), .O(inst11_O));
FIFO inst12 (.data_in({1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1}), .data_out(inst12_data_out), .reset(1'b0), .write(1'b1), .read(inst13_Tx_complete), .full(inst12_full), .half_full(inst12_half_full), .data_present(inst12_data_present), .CLK(CLKIN));
UARTTX inst13 (.data_in(inst12_data_out), .send_character(inst12_data_present), .en_16_x_baud(inst11_O), .serial_out(inst13_serial_out), .Tx_complete(inst13_Tx_complete), .CLK(CLKIN));
assign TX = inst13_serial_out;
endmodule


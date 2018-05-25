# Makefile to compile verilog
# DO THIS FIRST:
# source /opt/Xilinx/13.2/ISE_DS/settings32.sh
#

TARGET=test

#DEVICE?=xc3s250e
DEVICE?=xc3s500e
SPEED=4
PACKAGE=vq100
PART=${DEVICE}-${SPEED}-${PACKAGE}

PROG=papilio-prog
BSCAN=bscan_spi_${DEVICE}.bit


test.bit: test.route.ncd
	bitgen  -intstyle silent -w -g DebugBitstream:No -g Binary:no -g CRC:Enable -g ConfigRate:6 \
	-g CclkPin:PullUp -g M0Pin:PullUp -g M1Pin:PullUp -g M2Pin:PullUp -g ProgPin:PullUp \
	-g DonePin:PullUp -g HswapenPin:PullUp -g TckPin:PullUp -g TdiPin:PullUp -g TdoPin:PullUp \
	-g TmsPin:PullUp -g UnusedPin:PullDown -g UserID:0xFFFFFFFF -g DCMShutdown:Disable \
	-g DCIUpdateMode:AsRequired -g StartUpClk:CClk -g DONE_cycle:4 -g GTS_cycle:5 \
	-g GWE_cycle:6 -g LCK_cycle:NoWait -g Match_cycle:Auto -g Security:None -g DonePipe:No \
	-g DriveDone:No test.route.ncd test.bit

test.route.ncd: test.ncd
	par -w test.ncd test.route.ncd fpga.pcf #//-nopad 
	xdl -ncd2xdl test.route.ncd test.route.xdl

test.ncd: fpga.ncd
	cp fpga.ncd test.ncd

fpga.ncd: fpga.xdl
	xdl >xdl.log -xdl2ncd fpga

#burn: test.bit
#	impact >impact.log  -batch impact.cmd

upload: test.bit
	${PROG} -v -f test.bit -b ${BSCAN} -sa -r
	${PROG} -c

clean:
	rm -rf *.v *.ucf ${TARGET}.* fpga.xdl fpga.pcf fpga.ncd \
        xdl.log netlist.lst parout.ncd parout.pad parout_pad.csv \
        parout_pad.txt parout.par parout.ptwx parout.unroutes \
        usage_statistics_webtalk.html  webtalk.log \
        parout.xpi xlnx_auto_0.ise xlnx_auto_0_xdb xst _xmsgs xst.cmd xst.srp \
	spartan3_par.xrpt  test_bitgen.xwbt  xilinx_device_details.xml


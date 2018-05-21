import os
os.environ['MANTLE_TARGET'] = 'ice40'

from magma import *
from mantle import *
from loam.peripherals.timer import Timer
from loam.parts.lattice.ice40 import ICE40LP8K
from loam.parts.generic.crystal import Crystal
from loam.parts.generic.led import LED
from loam.parts.ftdi.ft232r import FT232R
from loam import Board

'''
### left side of board
set_io --warn-no-port pin1_usb_dp A3
set_io --warn-no-port pin2_usb_dn A4
set_io --warn-no-port pin3_clk_16mhz B4
set_io --warn-no-port pin4 B2
set_io --warn-no-port pin5 A2
set_io --warn-no-port pin6 A1
set_io --warn-no-port pin7 B1
set_io --warn-no-port pin8 C1
set_io --warn-no-port pin9 D1
set_io --warn-no-port pin10 E1
set_io --warn-no-port pin11 G1
set_io --warn-no-port pin12 H1
set_io --warn-no-port pin13 J1

### right side of board
set_io --warn-no-port pin14_sdo G6
set_io --warn-no-port pin15_sdi H7
set_io --warn-no-port pin16_sck G7
set_io --warn-no-port pin17_ss F7
set_io --warn-no-port pin18 D9
set_io --warn-no-port pin19 C9
set_io --warn-no-port pin20 E8
set_io --warn-no-port pin21 A9
set_io --warn-no-port pin22 A8
set_io --warn-no-port pin23 A7
set_io --warn-no-port pin24 A6
'''
class B2(Board):

    def __init__(self):

        super(B2, self).__init__("TinyFPGA B2")

        # Need to define the interface ...

        self.fpga = fpga = ICE40LP8K(board=self, package='cm81')

        self.CLKIN = fpga.IOT_211
        self.CLKIN.rename('CLKIN')

        self.Crystal = Crystal(16000000, board=self)
        wire(self.Crystal.O, self.CLKIN.I)

        self.Clock = fpga.clock
        wire(self.CLKIN.O, self.Clock.I)

        self.Timer = Timer(fpga, name='systimer')

        self.IOR_119 = fpga.IOR_119

    def DefineMain(self):
        return self.fpga.DefineMain()

    def main(self):
        return self.DefineMain()


if __name__ == '__main__':
    icestick = IceStick()

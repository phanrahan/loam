from magma import *
#from mantle import *
#from mantle.peripherals.timer import Timer

from loam.parts.silego.greenpak4 import SLG46620V

#from loam.parts.generic.crystal import Crystal
#from loam.parts.generic.led import LED
#from loam.parts.ftdi.ft232r import FT232R


class GPDevBoard(Board):

    def __init__(self):

        super(GPDevBoard, self).__init__("gpdevboard")

        # Need to define the interface ...

        self.fpga = fpga = SLG46620V(board=self)

        #self.CLKIN = fpga.PIO3_00
        #self.CLKIN.rename('CLKIN')

        #self.Crystal = Crystal(12000000, board=self)
        #wire(self.Crystal.O, self.CLKIN.I)

        #self.Clock = fpga.clock
        #wire(self.CLKIN.O, self.Clock.I)

        #self.Timer = Timer(fpga, name='systimer')

        self.PINS = [None, None, fpga.P2, fpga.P3, fpga.P4]

    def main(self):
        return self.fpga.main()


if __name__ == '__main__':
    gpdevboard = GPDevBoard()

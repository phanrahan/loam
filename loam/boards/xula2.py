from magma import *
from mantle import *
#from mantle.peripherals.timer import Timer
from loam import Board
from loam.parts.xilinx.spartan6 import XC6SLX9
from loam.parts.generic.crystal import Crystal

class Xula2(Board):
    vendor = 'xess'

    def __init__(self, fpga=XC6SLX9):
        super(Xula2,self).__init__("Xula2")

        # LX9  XC6SLX9-2-FTG256
        # LX25 XC6SLX25-2-FTG256

        self.fpga = fpga = fpga(board=self, package='ftg256')

        self.CLKIN = fpga.A9
        self.CLKIN.rename('CLKIN')

        self.Crystal = Crystal(12000000, board=self)
        wire(self.Crystal.O, self.CLKIN.I)

        self.Clock = fpga.clock
        wire(self.CLKIN.O, self.Clock.I)

        #self.Timer = Timer(fpga, name='systimer')

        self.PINS = [fpga.R7, fpga.R15, fpga.R16, fpga.M15, 
                    fpga.M16, fpga.K15, fpga.K16, fpga.J16,
                    fpga.J14, fpga.F15, fpga.F16, fpga.C16,
                    fpga.C15, fpga.B16, fpga.B15, fpga.T4,
                    fpga.R2, fpga.R1, fpga.M2, fpga.M1,
                    fpga.K3, fpga.J4, fpga.H1, fpga.H2, 
                    fpga.F1, fpga.F2, fpga.E1, fpga.E2,
                    fpga.C1, fpga.B1, fpga.B2, fpga.A2]


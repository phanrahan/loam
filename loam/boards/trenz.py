from magma import *
#from mantle import *
#from mantle.peripherals.timer import Timer
from loam import Board, Peripheral
from loam.parts.xilinx.zynq import XC7Z020
from loam.parts.generic.crystal import Crystal


class Trenz(Board):

    def __init__(self):
        super(Trenz,self).__init__("Trenz")

        self.fpga = fpga = XC7Z020(board=self)

        #set up all the clocks and resets
        for i in range(4):
          self.fclk0 =

        #Add the DRAM Part
        self.ddr = DRAM()
        
        #Add the MIO Part
        self.MIO = MIO()

        #Add the PS_ ports

        #set up all the axi ports
        self.axi = self.ps7.axi


from magma import wire
from mantle.xilinx.spartan6 import BUFG
from loam import Peripheral

#This is a clock from the PS7
class Clock(Peripheral):
    name = 'clock'

    def __init__(self, fpga, clk_num=0,frequency=None, name='CLK'):
        Peripheral.__init__(self, fpga, name)
        
        self.clk_num = clk_num
        self.basefreq = frequency
        self.freq = frequency

    #needs to generate collateral for setting the clock frequency
    def frequency(self, freq):
        self.freq = freq
        return self
    
    #needs to generate collateral for turning on the clock
    def on(self):
        Peripheral.on(self)
        return self

    def setup(self, main):
        assert(ps7.fclk[self.clk_num])
        bufg = BUFG()
        wire(main.ps7.fclk[self.clk_num], bufg.I)
        main.CLK = bufg.O
        return


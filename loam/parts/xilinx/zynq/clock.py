from magma import wire
from mantle.xilinx.spartan6 import BUFG
from loam import Peripheral

class Clock(Peripheral):
    name = 'clock'

    def __init__(self, fpga, frequency=None, name='clock'):
        Peripheral.__init__(self, fpga, name)

        self.basefreq = frequency
        self.freq = frequency

    def frequency(self, freq):
        self.freq = freq
        return self

    def on(self):
        Peripheral.on(self)
        return self

    def setup(self, main):
        if self.freq == self.basefreq:
            assert(main.CLKIN)
            bufg = BUFG()
            main.CLK = main.CLKIN
            wire(main.CLKIN, bufg.I)
            main.CLK = bufg.O

        return


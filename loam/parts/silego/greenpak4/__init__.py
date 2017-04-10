from magma import FPGA

from .silego import Silego
from .gpio import Pin, GPIO
#from .clock import Clock

__all__ = ['SLG46620V']


class Greenpak4(Silego):
    family = 'greenpak4'

    def __init__(self, name, board):
        super(Greenpak4,self).__init__(name, board)

        #self.clock = Clock(self)

    def STQFN20(self):
        self.package = 'STQFN20'

        Pin(self,  'VDD', "P1")
        GPIO(self, 'P2',  "P2")
        GPIO(self, 'P3',  "P3")
        GPIO(self, 'P4',  "P4")
        GPIO(self, 'P5',  "P5")
        GPIO(self, 'P6',  "P6")
        GPIO(self, 'P7',  "P7")
        GPIO(self, 'P8',  "P8")
        GPIO(self, 'P9',  "P9")
        GPIO(self, 'P10', "P10")
        Pin(self,  'GND', "P11")
        GPIO(self, 'P12', "P12")
        GPIO(self, 'P13', "P13")
        GPIO(self, 'P14', "P14")
        GPIO(self, 'P15', "P15")
        GPIO(self, 'P16', "P16")
        GPIO(self, 'P17', "P17")
        GPIO(self, 'P18', "P18")
        GPIO(self, 'P19', "P19")
        GPIO(self, 'P20', "P20")

class SLG46620V(Greenpak4):
    part = 'slg46620v'

    def __init__(self, name='slg46620v', board=None, package='stqfn20'):
        super(SLG46620V,self).__init__(name, board)
        self.STQFN20()



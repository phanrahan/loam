from magma import *

from ..spartan import Spartan
from ..gpio import GPIO, Pin, Clock
from ..clock import Clock as ClockPeripheral
#from .usart import USART

class Spartan3(Spartan):
    family = 'spartan3'

    def __init__(self, name, board, speed):
        super(Spartan3,self).__init__(name, board, speed)
        self.clock = ClockPeripheral(self)
        #self.USART = USART

    def VQ100(self):
        self.package = 'VQ100'

% for p in pins:
%   if p.gpio:
        GPIO(self, "${p.name}")
%   elif p.clock:
        Clock(self, "${p.name}")
%   else:
        Pin(self, "${p.name}")
%   endif
% endfor

class XC3S250E(Spartan3):
    part = 'xc3s250e'

    def __init__(self, name='', board=None, package='vq100', speed='4'):
        assert package in ['vq100']
        super(XC3S250E,self).__init__(name, board, speed)
        if package == 'vq100':
            self.VQ100()

if __name__ == "__main__":
    fpga = XC3S250E()

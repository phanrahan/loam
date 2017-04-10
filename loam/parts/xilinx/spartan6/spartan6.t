from magma import *
from ..spartan import Spartan
from ..gpio import GPIO, Pin
from ..clock import Clock
from .usart import USART

class Spartan6(Spartan):
    family = 'spartan6'

    def __init__(self, name, board, speed):
        super(Spartan6,self).__init__(name, board, speed)
        self.clock = Clock(self)
        self.USART = USART
        
    def TQG144(self):
        self.package = 'TQG144'
        
% for p in tqg144:
%   if p.gpio:
        GPIO(self, "${p.name}")
%   else:
        Pin(self, "${p.name}")
%   endif
% endfor

    def FTG256(self):
        self.package = 'FTG256'

% for p in ftg256:
%   if p.gpio:
        GPIO(self, "${p.name}")
%   else:
        Pin(self, "${p.name}")
%   endif
% endfor
        

class XC6SLX9(Spartan6):
    part = 'xc6slx9'

    def __init__(self, name='', board=None, package='tqg144',speed='2'):
        assert package in ['tqg144', 'ftg256']
        Spartan6.__init__(self, name, board, speed)
        if   package == 'tqg144':
            self.TQG144()
        elif package == 'ftg256':
            self.FTG256()

if __name__ == "__main__":
    fpga = XC6SLX9()


from ..altera import Altera
from ..gpio import GPIO, Pin, Clock
from ..clock import Clock as ClockPeripheral

class Cyclone4E(Altera):
    family = 'cyclone4'

    def __init__(self, name, board, speed):
        super(Altera,self).__init__(name, board)
        self.speed = speed
        self.clock = ClockPeripheral(self)

    def LBGA256(self):
        self.package = 'lbga256'

% for p in pins:
%   if p.gpio:
        GPIO(self, "${p.name}")
%   elif p.clock:
        Clock(self, "${p.name}")
%   endif
% endfor

class EP4CE22F17C6(Cyclone4E):
    part = 'EP4CE22F17C6'

    def __init__(self, name='', board=None, package='lbga256', speed='6'):
        assert package in ['lbga256']
        super(EP4CE22F17C6,self).__init__(name, board, speed)
        if package == 'lbga256':
            self.LBGA256()

if __name__ == "__main__":
    fpga = EP4CE22F17C6()

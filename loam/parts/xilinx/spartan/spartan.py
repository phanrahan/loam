from magma import *

__all__ = ['Spartan']

class Spartan(FPGA):
    vendor = 'xilinx'

    def __init__(self, name, board, speed):
        super(Spartan,self).__init__(name, board)
        self.speed = speed

    def ucf(self):
        s = 'CONFIG PART=%s-%s-%s;\n' % (self.part, self.package, self.speed)
        for g in self.pins:
            if g.used:  
                s += g.ucf() + '\n'
        return s

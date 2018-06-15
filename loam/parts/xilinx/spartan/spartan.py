from magma.compile import write_file
from loam import FPGA

__all__ = ['Spartan']

class Spartan(FPGA):
    vendor = 'xilinx'

    def __init__(self, name, board, speed):
        super(Spartan,self).__init__(name, board)
        self.speed = speed

    def constraints(self, filename):
        write_file(filename, 'ucf', self.ucf())

    def ucf(self):
        s = 'CONFIG PART=%s-%s-%s;\n' % (self.part, self.package, self.speed)
        for g in self.pins:
            if g.used:  
                s += g.ucf() + '\n'
        return s

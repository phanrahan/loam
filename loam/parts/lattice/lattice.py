from magma.compile import write_file
from loam import FPGA

__all__ = ['Lattice']

class Lattice(FPGA):
    vendor = 'lattice'

    def constraints(self, filename):
        write_file(filename, 'pcf', self.pcf())

    def pcf(self):
        s = ''
        for g in self.pins:
            if g.used:
                s += g.pcf() + '\n'
        return s


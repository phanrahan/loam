from magma import FPGA

__all__ = ['Lattice']

class Lattice(FPGA):
    vendor = 'lattice'

    def pcf(self):
        s = ''
        for g in self.pins:
            if g.used:
                s += g.pcf() + '\n'
        return s


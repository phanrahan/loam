from magma import FPGA

__all__ = ['Silego']

class Silego(FPGA):
    vendor = 'silego'

    def pcf(self):
        s = ''
        for g in self.pins:
            if g.used:
                s += g.pcf() + '\n'
        return s


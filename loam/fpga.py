import re
from magma import INPUT, OUTPUT, In, Out, Clock, Bit, Bits, Array, DefineCircuit
from .part import Part

__all__ = ['FPGA']

class FPGA(Part):

    """An FPGA"""

    def __init__(self, name='', board=None):
        Part.__init__(self, name, board)
        self.gpios = []
        self.peripherals = []

        self.parts = []

    def place(self, peripheral):
        self.peripherals.append(peripheral)
        peripheral.fpga = self

    def DefineMain(self):
        arrays = {}
        # form arrays
        for p in self.pins:
            if p.used:
                # find names of the form %s[%d]
                #  these are considered arrays
                match = re.findall('(.*)\[(\d+)\]', p.name)
                if match:
                    name, i = match[0]
                    i = int(i)
                    # keep track of the indices
                    if name in arrays:
                        arrays[name].append(i)
                    else:
                        arrays[name] = [i]

        # collect top level module arguments
        args = []
        for p in self.pins:
            if p.used:
                match = re.findall('(.*)\[(\d+)\]', p.name)
                if match:
                    name, i = match[0]
                    assert name in arrays
                    if len(arrays[name]) == 1:
                        p.rename(name)
                        args.append(name)
                        args.append(In(Bit) if p.direction == INPUT else Out(Bit))
                    else:
                        i = int(i)
                        if i == max(arrays[name]):
                            args.append(name)
                            T = Bits[i+1]
                            args.append(In(T) if p.direction == INPUT else Out(T))
                else:
                    args.append(p.name)
                    if p.name == 'CLKIN':
                        assert p.direction == INPUT
                        args.append(In(Clock))
                    else:
                        args.append(In(Bit) if p.direction == INPUT else Out(Bit))

        D = DefineCircuit('main',*args, __magma_no_cache__=True)
        D.fpga = self
        for p in self.peripherals:
            if p.used:
                #print(p)
                p.setup(D)
        return D

    def main(self):
        return self.DefineMain()

    def constraints(self, filename):
        pass

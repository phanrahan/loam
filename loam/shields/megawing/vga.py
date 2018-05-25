from magma import *
from mantle.util.edge import falling
from loam import Part
from loam.peripherals.debounce import debounce

class VGA(Part):
    IO = ["I", Bits(8), "HSYNC", In(Bit), "VSYNC", In(Bit)]

    def __init__(self, board):
        Part.__init__(self, board, 'VGA')

    def on(self):
        for i in range(8):
            t = self.I[i].trace().inst.on()
        t = self.HSYNC.trace().inst.on()
        t = self.VSYNC.trace().inst.on()

        Part.on(self) 
        return self

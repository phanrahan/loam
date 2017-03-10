from magma import *
from mantle.peripherals.debounce import debounce
from mantle.util.edge import falling

class VGA(Part):
    IO = ["input I", Array(8,Bit), "input HSYNC", Bit, "input VSYNC", Bit]

    def __init__(self, board):
        Part.__init__(self, board, 'VGA')

    def on(self):
        for i in range(8):
            t = self.I[i].trace().inst.on()
        t = self.HSYNC.trace().inst.on()
        t = self.VSYNC.trace().inst.on()

        Part.on(self) 
        return self

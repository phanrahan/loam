from magma import *


class Flash(Part):
    name = 'Flash'

    IO = ["input  CS",   Bit,
          "output MISO", Bit,
          "input  MOSI", Bit,
          "input  SCLK", Bit]

    def __init__(self, name='Flash', board=None:
        super(Flash, self).__init__(name, board)

    def on(self):
        # self.CS.trace().inst.on()
        # self.MISO.trace().inst.on()
        # self.MOSI.trace().inst.on()
        # self.SCLK.trace().inst.on()

        Part.on(self)
        return self



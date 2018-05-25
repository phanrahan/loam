from magma import *
from loam import Peripheral

class SPI(Peripheral):

    name = 'spi'

    IO = ["MOSI", Out(Bit), 
          "MISO", In(Bit), 
          "SCLK", Out(Bit),
          "CS",   Out(Bit)]

    def __init__(self, name='spi0', board=None):
        super(SPI,self).__init__(name, board)

    def on(self):

        miso = self.MISO.getgpio()
        if miso:
            miso.input().on()

        mosi = self.MOSI.getgpio()
        if mosi:
            mosi.output().on()

        # must have sscl
        sclk = self.SCLK.getgpio()
        sclk.output().on()

        ssel = self.CS.getgpio()
        if ssel:
            ssel.output().on()

        Peripheral.on(self)
        return self

    # needs setup()




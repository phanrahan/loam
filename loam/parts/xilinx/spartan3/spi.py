from magma import *

class SPI(Peripheral):

    name = 'spi'

    IO = ["output MOSI", Bit, 
          "input  MISO", Bit, 
          "output SCLK", Bit,
          "output CS",   Bit]

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




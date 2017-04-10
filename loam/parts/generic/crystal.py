from magma import *


class Crystal(Part):
    name = 'Crystal'
    IO = ['output O', Bit]

    def __init__(self, freq, name='Crystal', board=None):
        super(Crystal, self).__init__(name, board)
        self.frequency = freq

    def on(self):
        gpio = self.O.getgpio()
        gpio.input().on()
        Part.on(self)
        return self

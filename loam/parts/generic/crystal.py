from magma import Bit, Out
from loam import Part

class Crystal(Part):
    name = 'Crystal'
    IO = ['O', Out(Bit)]

    def __init__(self, freq, name='Crystal', board=None):
        super(Crystal, self).__init__(name, board)
        self.frequency = freq

    def on(self):
        gpio = self.O.getgpio()
        gpio.input().on()
        Part.on(self)
        return self

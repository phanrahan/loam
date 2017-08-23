from magma import Bit, Out
from loam import Part

class Button(Part):

    name = 'button'
    IO = ["O", Out(Bit)]

    def __init__(self, name='button', board=None):
        super(Button, self).__init__(name, board)

    def on(self):
        gpio = self.O.getgpio()
        gpio.input().on()
        Part.on(self)
        return self

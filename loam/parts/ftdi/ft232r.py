from magma import Bit, In, Out
from loam import Part

class FT232R(Part):
    name = 'ft232r'
    IO = ["RX", In(Bit), "TX", Out(Bit)]

    def __init__(self, name='console', board=None):
        Part.__init__(self, name, board)
        self.usart = None

    def peripheral(self, usart):
        self.usart = usart
        return self

    def on(self):
        self.usart.on()
        Part.on(self)
        return self



from magma import Bits, In
from loam import Part

class Display(Part):
    name = 'Display'

    IO = ["cathodes", In(Bits(8)), "anodes", In(Bits(4))]

    def __init__(self, name='display', board=None): 
        super(Display, self).__init__(name, board)
        self.display = None

    def peripheral(self, display):
        self.display = display
        return self

    def on(self):
        self.display.on()
        Part.on(self)
        return self


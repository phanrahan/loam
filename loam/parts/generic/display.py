from magma import *

class Display(Part):
    name = 'Display'

    IO = ["input cathodes", Array(8,Bit), "input anodes", Array(4,Bit)]

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


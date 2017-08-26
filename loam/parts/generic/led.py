from magma import Bits, Bit, In
from loam import Part

class LED(Part):

    name = 'LED'
    IO = ["I", In(Bit)]

    def __init__(self, name='LED', board=None):
        super(LED, self).__init__(name, board)

    def on(self):
        gpio = self.I.getgpio()
        gpio.output().on()
        Part.on(self)
        return self

def LEDs(n, name='LED', board=None):

    class _LEDs(Part):

        name = 'LEDs'
        IO = ["I", In(Bits(n))]

        def __init__(self):
            super(_LEDs, self).__init__(name, board)
            self.n = n

        def on(self, n=None):
            if n is None:
                n = self.n
            assert n <= self.n
            for i in range(n):
                gpio = self.I[i].getgpio()
                gpio.output().on()
            Part.on(self)
            return self

    return _LEDs()

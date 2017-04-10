from magma import *


class Switch(Part):

    name = 'switch'
    IO = ["output O", Bit]

    def __init__(self, name='switch', board=None):
        super(Switch, self).__init__(name, board)

    def on(self):
        gpio = self.O.getgpio()
        gpio.input().on()
        Part.on(self)
        return self


def Switches(n, name='switches', board=None):

    class _Switches(Part):

        name = 'switch'+str(n)
        IO = ["output O", Array(n, Bit)]

        def __init__(self):
            super(_Switches, self).__init__(name, board)
            self.n = n

        def on(self, n):
            assert n <= self.n
            for i in range(n):
                gpio = self.O[i].getgpio()
                gpio.input().on()
            Part.on(self)
            return self

    return _Switches()

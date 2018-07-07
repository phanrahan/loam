from magma import INPUT, OUTPUT, INOUT, In, Out, Bit
from loam import Peripheral

class Pin(Peripheral):
    def __init__(self, fpga, name, pin):
        super(Pin,self).__init__(fpga, name)
        self.pin = str(pin) # pin name/number
        self.pinname = self.name

        self.fpga.pins.append(self)
        setattr( fpga, name, self )

    def pcf(self):
        return 'set_io %s %s' % (self.name, self.pin)  


class GPIO(Pin):
    IO = ['I', In(Bit), 'O', Out(Bit)]

    def __init__(self, fpga, name, pin):
        Pin.__init__(self, fpga, name, pin)

        self.fpga.gpios.append(self)

        self.direction = None
        self.Z = False

    def input(self):
        self.direction = INPUT
        return self

    def output(self):
        self.direction = OUTPUT
        return self

    def inout(self):
        self.direction = INOUT
        return self


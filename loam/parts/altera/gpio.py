from magma import INPUT, OUTPUT, INOUT, In, Out, Bit
from loam import Peripheral

class Pin(Peripheral):
    def __init__(self, fpga, name, ucfopts=None):
        super(Pin,self).__init__(fpga, name)
        self.pinname = self.name

        self.fpga.pins.append(self)
        setattr( fpga, name, self )

        self.direction = None
        self.ucfopts = {'IOSTANDARD': 'LVTTL', "LOC": self.pinname}
        if ucfopts:
            self.ucfopts.update(ucfopts)
        self.off()

    def input(self):
        self.direction = INPUT
        return self

    def output(self):
        self.direction = OUTPUT
        return self

    def inputoutput(self):
        self.direction = INOUT
        return self

    def reorient(self,direction):
        self.direction = direction
        return self

    def setucfopts(self,ucfopts):
        self.ucfopts.update(ucfopts)

    def qsf(self):
        return 'set_location_assignment PIN_%s -to %s' % (self.pinname, self.name)

class GPIO(Pin):
    IO = ['I', In(Bit), 'O', Out(Bit)]

    def __init__(self, fpga, name):
        Pin.__init__(self, fpga, name)

        self.fpga.gpios.append(self)

        self.direction = INPUT
        self.Z = False

class Clock(GPIO):
    IO = ['I', In(Bit), "O", Out(Bit)]

    def __init__(self, fpga, name):
        GPIO.__init__(self, fpga, name)

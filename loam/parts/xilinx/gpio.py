from magma import *

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

    def ucf(self):
        ucfopts = []
        for opt,val in self.ucfopts.items():
            if opt!="IOSTANDARD":
                val = '"%s"' % (val)
            ucfopts.append(opt+"="+val)

        return 'NET "%s" %s;' % (self.name, " | ".join(ucfopts))  

class GPIO(Pin):
    IO = ['input I', Bit, 'output O', Bit]

    def __init__(self, fpga, name):
        Pin.__init__(self, fpga, name)

        self.fpga.gpios.append(self)

        self.direction = INPUT
        self.Z = False

class Clock(GPIO):
    IO = ['input I', Bit, "output O", Bit]

    def __init__(self, fpga, name):
        GPIO.__init__(self, fpga, name)

    def ucf(self):
        return 'NET %s LOC="%s" | IOSTANDARD = LVCMOS25 | PERIOD = 31.25ns ;' % (self.name, self.pinname)


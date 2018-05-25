from magma import INPUT, OUTPUT, INOUT, In, Out, Bit
from loam import Peripheral

class Clock(Peripheral):
    name = 'clock'
    IO = ['I', In(Bit), 'O', Out(Bit)]

    def __init__(self, fpga, freq=0, name='clock'):
        super(Clock,self).__init__(fpga, name)
        self.freq = freq

    def frequency(self, freq):
        self.freq = freq
        return self

    def on(self):
        clkin = self.I.getgpio()
        clkin.input().on()
        Peripheral.on(self)
        return self

    def setup(self, main):
        clkin = self.I.getgpio()
        crystal = clkin.I.getinst()
        assert crystal
        basefrequency = crystal.frequency

        if not self.freq:
            self.freq = basefrequency

        #print(basefrequency, self.freq)
        assert basefrequency or self.freq

        if self.freq == basefrequency:
            main.CLK = main.CLKIN
            return

        assert True


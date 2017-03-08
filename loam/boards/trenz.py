from magma import *
from mantle import *

from parts.xilinx.zynq.zynq import XC7Z020

from parts.generic.crystal import Crystal
from peripherals.timer import Timer

class Clock(Peripheral):
    def __init__(self, fpga, crystal):
        super(Clock,self).__init__(fpga, 'Clock')
        self.fpga.place(self)
        self.crystal = crystal
        self.basefreq = crystal.frequency
        self.freq = crystal.frequency

    def frequency(self, freq):
        self.freq = freq
        return self

    def on(self):
        self.crystal.on()
        Peripheral.on(self)
        return self

    def setup(self, main):
        pass
        if self.freq == self.basefreq:
            main.CLK = main.CLKIN
            return

        dcm = DCM(self.freq, self.basefreq)
        bufg = BUFG()
        wire(main.CLKIN, dcm.I)
        wire(dcm, bufg)
        main.CLK = bufg.O

    #def Clock(self):
    #    if self.CLK is None:
    #        ClkBuf = BufG(site=(0, 0))
    #        wire(In("Y9").O, ClkBuf.I)
    #        self.CLKIN = curDesign.CLKIN = ClkBuf.I
    #        self.CLK = curDesign.CLK = ClkBuf.O
    #    return self.CLK

class Trenz(Board):

    def __init__(self):
        super(Trenz,self).__init__("Trenz")

        self.fpga = fpga = XC7Z020(board=self)

        #self.CLKIN = fpga.Y9
        #self.CLKIN.rename('CLKIN')

        #self.Clock = Clock(fpga, self.Crystal)

        padlist = [
                "C12", "D10", "C10", "D13", "C14", "D11", "B10", "D12", "B9", "E13", "B11", "D8", "C8", "E14", "C13", "F13", "B14", "A9", "F14", "B12", "G13", "C7", "F9", "A11", "E8", "A12", "D7", "A13", "F12", "B7", "E11", "A14", "F11", "A8", "E10", "A7", "E9", "D6", "E6", "B6", "A6", "C5", "B4", "G7", "C4", "E5", "D5", "A4", "A3", "E4", "F6", "A2", "A1", "G6", "R4", "N7", "M7", "R5", "P5", "F3", "V2", "N2",
                "H2", "C2", "W2", "P2", "J2", "D2", "Y1", "W3", "Y3", "W1", "U2", "AA1", "U1", "AA3", "R1", "M2", "T2", "R3", "T1", "N3", "T3", "M1", "K3", "J1", "K1", "L3", "L2", "L1", "G1", "G2", "F1", "F2", "E1", "E3", "D3", "B2", "C3", "D1", "AA2", "P1", "H3", "B1", "P6", "V3", "N4", "N5", "P3", "M6", "L6", "L7", "G4", "F4", "H4", "G5", "J3", "H5", "J5", "J6", "J7", "K5", "K6", "L4", "K4", "M5", "M4", "B5", "C9", "F7"]
        #self.iopads = [IOPAD(i) for i in padlist]

    def main(self):
        #if self.Clock.used:
        #    self.fpga.frequency = self.Clock.frequency
        return self.fpga.main()


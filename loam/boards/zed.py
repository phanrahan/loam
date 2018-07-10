from magma import *
from mantle import *
#from mantle.peripherals.timer import Timer

from loam.parts.xilinx.zynq import XC7Z020
from loam.parts.generic.switch import Switches
from loam.parts.generic.led import LEDs


class Zed(Board):

    def __init__(self):
        super(Zed,self).__init__("Zedboard")

        self.fpga = fpga = XC7Z020(board=self)

        self.ps7 = fpga.ps7

        self.Clock = fpga.clock

        #self.Timer = Timer(fpga, name='systimer')

        self.LED = LEDs(8, name="LED", board=self)
        leds = ["T22", "T21", "U22", "U21", "V22", "W22", "U19", "U14"]
        for i,k in enumerate(leds):
             led = getattr(fpga, k)
             led.rename('LED[%d]' % i).output()
             wire(led, self.LED.I[i])

        self.Switch = Switches(8, name='Switch', board=self)
        switches = ["F22", "G22", "H22", "F21", "H19", "H18", "H17", "M15"]
        for i,k in enumerate(switches):
             switch = getattr(fpga, k)
             switch.rename('SWITCH[%d]' % i).input()
             wire(self.Switch.O[i], switch)


#        ps7pads = [
#              "inout", "MIO", ["C12", "D10", "C10", "D13", "C14", "D11", "B10", "D12", "B9", "E13", "B11", "D8", "C8", "E14", "C13", "F13", "B14", "A9", "F14", "B12", "G13", "C7", "F9", "A11", "E8", "A12", "D7", "A13", "F12", "B7", "E11", "A14", "F11", "A8", "E10", "A7", "E9", "D6", "E6", "B6", "A6", "C5", "B4", "G7", "C4", "E5", "D5", "A4", "A3", "E4", "F6", "A2", "A1", "G6"],
#              "input","DDR_WEB","R4",
#              "inout", "DDR_VRP", "N7",
#              "inout", "DDR_VRN", "M7",
#              "inout", "DDR_RAS_n","R5",
#              "inout", "DDR_ODT", "P5",
#              "inout", "DDR_DRSTB","F3",
#              "inout", "DDR_DQS",["V2", "N2","H2", "C2"],
#              "inout", "DDR_DQS_n",["W2", "P2", "J2", "D2"],
#              "inout", "DDR_DQ", ["Y1", "W3", "Y3", "W1", "U2", "AA1", "U1", "AA3", "R1", "M2", "T2", "R3", "T1", "N3", "T3", "M1", "K3", "J1", "K1", "L3", "L2", "L1", "G1", "G2", "F1", "F2", "E1", "E3", "D3", "B2", "C3", "D1"],
#              "inout", "DDR_DM", ["AA2", "P1", "H3", "B1"],
#              "inout", "DDR_CS_n", "P6",
#              "inout", "DDR_CKE", "V3",
#              "inout", "DDR_Clk", "N4",
#              "inout", "DDR_Clk_n", "N5",
#              "inout", "DDR_CAS_n", "P3",
#              "inout", "DDR_BankAddr", ["M6", "L6", "L7"],
#              "inout", "DDR_Addr", ["G4", "F4", "H4", "G5", "J3", "H5", "J5", "J6", "J7", "K5", "K6", "L4", "K4", "M5", "M4"],
#              "inout", "PS_PORB", "B5", 
#              "inout", "PS_SRSTB", "C9",
#              "inout", "PS_CLK", "F7"
#            ]
#        assert(len(ps7pads)%3==0)
#        self.ps7pads = {}
#        for i in range(len(ps7pads)/3):
#            direction,name,portnames = ps7pads[3*i],ps7pads[3*i+1],ps7pads[3*i+2]
#            if not isinstance(portnames,list):
#                portnames = [portnames]
#            part = Genpart(self,direction,name,len(portnames))
#            print(direction,name,part.I)
#            self.ps7pads[name]=part
#            for n in range(len(portnames)):
#                port = getattr(fpga,portnames[n])
#                assert(port)
#                port.rename("%s[%d]" % (name,n)).reorient(direction)
#                #TODO this is not necessarily O
#                wire(port,part.I[n])


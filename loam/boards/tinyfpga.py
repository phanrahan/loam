import magma as m
from loam.parts.lattice.ice40 import ICE40LP8K
from loam.parts.generic.crystal import Crystal
from loam.parts.generic.led import LED
from loam.parts.ftdi.ft232r import FT232R
#from loam.peripherals.timer import Timer
from loam import Board

'''
SPECS: Lattice ICE40LP8K
-------------------------------
Logics Cells (LUT + FF)  : 7680
RAM4K Memory Blocks      : 32
RAM4K RAM bits           : 128K
PLLs                     : 2    
Programmable I/O pins    : 178
Differential Input Pairs : 23
-------------------------------
'''

__all__ = ['B2', 'BX']

class B(Board):

    def __init__(self, name):

        super(B, self).__init__(name)

        self.fpga = fpga = ICE40LP8K(board=self, package='cm81')

        # SPI interface
        self.SCK = fpga.IOB_107_SCK # G7 
        self.SCK.rename('SCK').output()
        self.SS  = fpga.IOB_108_SS  # F7 
        self.SS.rename('SS').output()

        # USB interface
        self.USB_DP = fpga.IOT_211 # B4 USB DP
        self.USB_DP.rename('USB_DP').inout()
        self.USB_DN = fpga.IOT_208 # A4 USB DN
        self.USB_DN.rename('USB_DN').inout()



    def set_pins(self):
        for i in range(1,len(self.header)):
            name = f"PIN{i}"
            pin = self.header[i]
            pin.rename( name )
            setattr(self, name, pin )



class B2(B):
    def __init__(self):
        super(B2, self).__init__("TinyFPGA B2")

        fpga = self.fpga

        self.CLKIN = fpga.IOT_211 # B4
        self.CLKIN.rename('CLKIN')

        self.Crystal = Crystal(16000000, board=self)
        m.wire(self.Crystal.O, self.CLKIN.I)

        self.Clock = fpga.clock
        m.wire(self.CLKIN.O, self.Clock.I)

        self.SDO = fpga.IOB_105_SDO # G6 
        self.SDO.rename('SDO').output()
        self.SDI = fpga.IOB_106_SDI # H7 
        self.SDI.rename('SDI').input()

        self.header = [
           None,

           fpga.IOT_217, # A3 USB DP
           fpga.IOT_208, # A4 USB DN
           fpga.IOT_211, # B4 CLK

           fpga.IOL_2B,  # B2 
           fpga.IOT_221, # A2 
           fpga.IOT_224, # A1 
           fpga.IOL_3A,  # B1 
           fpga.IOL_3B,  # C1 
           fpga.IOL_10A, # D1 
           fpga.IOL_10B, # E1 
           fpga.IOL_24B, # G1 
           fpga.IOB_54,  # H1 
           fpga.IOB_55,  # J1 

           fpga.IOB_105_SDO, # G6 
           fpga.IOB_106_SDI, # H7 
           fpga.IOB_107_SCK, # G7 
           fpga.IOB_108_SS,  # F7 

           fpga.IOR_119,  # D9 
           fpga.IOR_148,  # C9 
           fpga.IOR_140_GBIN3, # E8 
           fpga.IOR_116, # A9 
           fpga.IOT_174, # A8 
           fpga.IOT_177, # A7 
           fpga.IOT_185 # A6 
        ]

        self.set_pins()


         
class BX(B):
    def __init__(self):
        super(BX, self).__init__("TinyFPGA BX")

        fpga = self.fpga

        self.CLKIN = fpga.IOL_2B # pin B2
        self.CLKIN.rename('CLKIN')

        self.Crystal = Crystal(16000000, board=self)
        m.wire(self.Crystal.O, self.CLKIN.I)

        self.Clock = fpga.clock
        m.wire(self.CLKIN.O, self.Clock.I)

        self.LED =  fpga.IOT_218 # B3
        self.LED.rename('LED').output()

        self.I0O = fpga.IOB_105_SDO # G6 
        self.I0O.rename('IO0').output()
        self.IO1 = fpga.IOB_106_SDI # H7 
        self.IO1.rename('IO1').input()
        self.I02 = fpga.IOB_82_GBIN4 # H4 
        self.I02.rename('IO2').output()
        self.IO3 = fpga.IOR_109 # J8 
        self.IO3.rename('IO3').input()

        self.USB_PU = fpga.IOT_217 # A3 USB DN
        self.USB_DN.rename('USB_PU').inout()

        self.header = [
           None,

           # left side
           fpga.IOT_221, # A2 
           fpga.IOT_224, # A1 
           fpga.IOL_3A,  # B1
           fpga.IOL_2A,  # C2 
           fpga.IOL_3B,  # C1 
           fpga.IOL_7A,  # D2 
           fpga.IOL_10A, # D1 
           fpga.IOL_13A, # E2 
           fpga.IOL_10B, # E1 
           fpga.IOL_26A, # G2 
           fpga.IOB_54,  # H1 
           fpga.IOB_55,  # J1 
           fpga.IOL_26B, # H2 

           # right side
           fpga.IOR_111, # H9 
           fpga.IOR_119, # D9 
           fpga.IOR_141_GBIN2, # D8 
           fpga.IOR_148, # C9 
           fpga.IOR_116, # A9 
           fpga.IOT_170, # B8 
           fpga.IOT_174, # A8 
           fpga.IOT_180, # B7 
           fpga.IOT_177, # A7 
           fpga.IOT_183, # B6 
           fpga.IOT_185,  # A6 

           # bottom
           fpga.IOL_24B, # G1 
           fpga.IOB_57,  # J3 
           fpga.IOB_70,  # J4 
           fpga.IOR_112, # G9 
           fpga.IOR_110, # J9 
           fpga.IOR_140_GBIN3, # E8 
           fpga.IOB_56,  # J2 
        ]

        self.set_pins()
         


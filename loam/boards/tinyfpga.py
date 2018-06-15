import magma as m
from loam.parts.lattice.ice40 import ICE40LP8K
from loam.parts.generic.crystal import Crystal
from loam.parts.generic.led import LED
from loam.parts.ftdi.ft232r import FT232R
#from loam.peripherals.timer import Timer
from loam import Board

class B2(Board):

    def __init__(self):

        super(B2, self).__init__("TinyFPGA B2")

        # Need to define the interface ...

        self.fpga = fpga = ICE40LP8K(board=self, package='cm81')
        m.set_mantle_target(fpga.family)

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

        for i in range(1,25):
            name = "PIN{}".format(i)
            pin = self.header[i]
            pin.rename( name )
            setattr(self, name, pin )

        self.CLKIN = fpga.IOT_211
        self.CLKIN.rename('CLKIN')

        self.Crystal = Crystal(16000000, board=self)
        m.wire(self.Crystal.O, self.CLKIN.I)

        self.Clock = fpga.clock
        m.wire(self.CLKIN.O, self.Clock.I)

        #self.Timer = Timer(fpga, name='systimer')

        self.SDO = fpga.IOB_105_SDO # G6 
        self.SDO.rename('SDO').output()
        self.SDI = fpga.IOB_106_SDI # H7 
        self.SDI.rename('SDI').input()
        self.SCK = fpga.IOB_107_SCK # G7 
        self.SCK.rename('SCK').output()
        self.SS  = fpga.IOB_108_SS  # F7 
        self.SS.rename('SS').output()

        self.USB_DP = fpga.IOT_217 # A3 USB DP
        self.USB_DP.rename('USB_DP').inout()
        self.USB_DN = fpga.IOT_208 # A4 USB DN
        self.USB_DN.rename('USB_DN').inout()



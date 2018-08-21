import magma as m
from loam.parts.lattice.ice40.ice40 import ICE40HX8K
from loam.parts.generic.crystal import Crystal
from loam.parts.generic.led import LED
from loam.parts.ftdi.ft232r import FT232R
#from loam.peripherals.timer import Timer
from loam import Board

'''
SPECS: Lattice ICE40HX8K
-------------------------------
Logics Cells (LUT + FF)  : 7680
RAM4K Memory Blocks      : 32
RAM4K RAM bits           : 128K
PLLs                     : 2    
Programmable I/O pins    : 206
Differential Input Pairs : 26
-------------------------------
'''


class HX8KBoard(Board):

    def __init__(self):
        super(HX8KBoard,self).__init__("HX8K Breakout Board")

        # Need to define the interface ...

        self.fpga = fpga = ICE40HX8K(board=self, package='ct256')

        self.CLKIN = fpga.PIO3_26
        self.CLKIN.rename('CLKIN')

        self.Crystal = Crystal(12000000, board=self)
        m.wire(self.Crystal.O, self.CLKIN.I)

        self.Clock = fpga.clock
        m.wire(self.CLKIN.O, self.Clock.I)

        #self.Timer = Timer(fpga, name='systimer')

        leds = ["PIO0_39", "PIO0_41", "PIO0_42", "PIO0_44",
                "PIO0_45", "PIO0_46", "PIO0_47", "PIO0_51"]
        for i,k in enumerate(leds):
             name = "D%d" % (i+1)
             pin = getattr(fpga, k)
             pin.rename(name).output()
             led = LED(name=name, board=self)
             m.wire(pin, led.I)
             setattr(self, name, led)

        GND = None
        VCC = None

        self.J1 = []
        self.J2 = [VCC,          VCC,
                   VCC,          fpga.PIO1_01,
                   fpga.PIO1_04, fpga.PIO1_03,
                   GND,          GND, 
                   fpga.PIO1_08, fpga.PIO1_14,

                   fpga.PIO1_12, fpga.PIO1_16,
                   fpga.PIO1_20, fpga.PIO1_21,
                   GND,          GND, 
                   fpga.PIO1_18, fpga.PIO1_22,
                   fpga.PIO1_37, fpga.PIO1_42,

                   fpga.PIO1_19, fpga.PIO1_29,
                   GND,          GND, 
                   fpga.PIO1_28, fpga.PIO1_21,
                   fpga.PIO1_30, fpga.PIO1_36,
                   fpga.PIO1_34, fpga.PIO1_46,

                   GND,          GND,
                   fpga.PIO1_38, fpga.PIO1_44,
                   fpga.PIO1_40, fpga.PIO1_51,
                   fpga.PIO1_47, fpga.PIO1_49,
                   GND,          GND]


        # self.J2[3].rename( "J2_3" )
        # self.J2[4].rename( "J2_4" )
        
        for i in range(len(self.J2)):
            if (self.J2[i] != VCC) & (self.J2[i] != GND):
                self.J2[i].rename( "J2_%d" % i )

        self.J3 = []
        self.J4 = []


        # USART
        self.DCD = fpga.PIO0_01
        self.DCD.rename('DCD').output()
        self.DSR = fpga.PIO0_03
        self.DSR.rename('DSR').output()
        self.DTR = fpga.PIO0_07
        self.DTR.rename('DTR').input()
        self.CTS = fpga.PIO0_08
        self.CTS.rename('CTS').output()
        self.RTS = fpga.PIO0_09
        self.RTS.rename('RTS').input()

        self.TX = fpga.PIO0_13
        self.TX.rename('TX').output()
        self.RX = fpga.PIO0_14
        self.RX.rename('RX').input()

        # create usart part
        #self.usart = FT232R(board=self)
        #m.wire(self.TX, self.usart.RX)
        #m.wire(self.usart.TX, self.RX)

        # create usart peripheral ...


        # SPI to Flash
        # self.MISO = fpga.PIOS_00
        # self.MOSI = fpga.PIOS_01
        # self.SCLK = fpga.PIOS_02
        # self.CS   = fpga.PIOS_03



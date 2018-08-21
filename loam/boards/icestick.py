import magma as m
from loam.parts.lattice.ice40 import ICE40HX1K
from loam.parts.generic.crystal import Crystal
from loam.parts.generic.led import LED
from loam.parts.ftdi.ft232r import FT232R
#from loam.peripherals.timer import Timer
from loam import Board

'''
SPECS: Lattice ICE40HX1K
-------------------------------
Logics Cells (LUT + FF)  : 1280
RAM4K Memory Blocks      : 16
RAM4K RAM bits           : 64K
PLLs                     : 1    
Programmable I/O pins    : 95
Differential Input Pairs : 11
-------------------------------
'''


class IceStick(Board):

    def __init__(self):

        super(IceStick, self).__init__("IceStick")

        # Need to define the interface ...

        self.fpga = fpga = ICE40HX1K(board=self, package='tq144')

        self.CLKIN = fpga.PIO3_00
        self.CLKIN.rename('CLKIN')

        self.Crystal = Crystal(12000000, board=self)
        m.wire(self.Crystal.O, self.CLKIN.I)

        self.Clock = fpga.clock
        m.wire(self.CLKIN.O, self.Clock.I)

        #self.Timer = Timer(fpga, name='systimer')

        leds = ["PIO1_14", "PIO1_13", "PIO1_12", "PIO1_11", "PIO1_10"]
        for i,k in enumerate(leds):
             name = "D%d" % (i+1)
             pin = getattr(fpga, k)
             pin.rename(name).output()
             led = LED(name=name, board=self)
             m.wire(pin, led.I)
             setattr(self, name, led)

        # Pmod connector
        self.PMOD0 = [fpga.PIO1_02, fpga.PIO1_03, fpga.PIO1_04, fpga.PIO1_05]
        for i in range(len(self.PMOD0)):
             self.PMOD0[i].rename( "PMOD0[%d]" % i )

        self.PMOD1 = [fpga.PIO1_06, fpga.PIO1_07, fpga.PIO1_08, fpga.PIO1_09]
        for i in range(len(self.PMOD1)):
             self.PMOD1[i].rename( "PMOD1[%d]" % i )

        self.J1 = [fpga.PIO0_02, fpga.PIO0_03, fpga.PIO0_04, fpga.PIO0_05,
                   fpga.PIO0_06, fpga.PIO0_07, fpga.PIO0_08, fpga.PIO0_09]
        for i in range(len(self.J1)):
             self.J1[i].rename( "J1[%d]" % i )

        self.J3 = [fpga.PIO2_17, fpga.PIO2_16, fpga.PIO2_15, fpga.PIO2_14,
                   fpga.PIO2_13, fpga.PIO2_12, fpga.PIO2_11, fpga.PIO2_10]
        for i in range(len(self.J3)):
             self.J3[i].rename( "J3[%d]" % i )


        # USART is connected to port B on the ftdi2232H
        self.DCD = fpga.PIO3_02
        self.DCD.rename('DCD').output()
        self.DSR = fpga.PIO3_03
        self.DSR.rename('DSR').output()
        self.DTR = fpga.PIO3_04
        self.DTR.rename('DTR').input()
        self.CTS = fpga.PIO3_05
        self.CTS.rename('CTS').output()
        self.RTS = fpga.PIO3_06
        self.RTS.rename('RTS').input()
        self.TX = fpga.PIO3_07
        self.TX.rename('TX').output()
        self.RX = fpga.PIO3_08
        self.RX.rename('RX').input()

        # create usart part
        # self.usart = FT232R(board=self)
        # m.wire(self.TX, self.usart.RX)
        # m.wire(self.usart.TX, self.RX)

        # create usart peripheral


        # SPI to Flash
        # self.SCLK = fpga.PIOS_00
        # self.MOSI = fpga.PIOS_01
        # self.MISO = fpga.PIOS_02
        # self.CS   = fpga.PIOS_03

        # IR
        #self.IRTX = fpga.PIO1_18
        #self.IRTX.rename('IRTX').output()
        #self.IRRX = fpga.PIO1_19
        #self.IRRX.rename('IRRX').input()
        #self.IRSD = fpga.PIO1_20
        #self.IRSD.rename('SD').output()


if __name__ == '__main__':
    icestick = IceStick()

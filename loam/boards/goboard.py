import magma as m
from loam.peripherals.timer import Timer
from loam.parts.lattice.ice40 import ICE40HX1K, ICE40HX8K
from loam.parts.generic.crystal import Crystal
from loam.parts.generic.switch import Switch
from loam.parts.generic.led import LED, LEDs
from loam.parts.generic.button import Button
from loam.parts.ftdi.ft232r import FT232R
from loam import Board


class GoBoard(Board):

    def __init__(self, fpga=ICE40HX1K):
        super(GoBoard,self).__init__("Nandland Go Board")

        # Need to define the interface ...

        self.fpga = fpga = fpga(board=self, package='vq100')

        self.CLKIN = fpga.IOL_7A
        self.CLKIN.rename('CLKIN')

        self.Crystal = Crystal(25000000, board=self)
        m.wire(self.Crystal.O, self.CLKIN.I)

        self.Clock = fpga.clock
        m.wire(self.CLKIN.O, self.Clock.I)


        self.Timer = Timer(fpga, name='systimer')

        # LEDs
        leds = ["IOR_56", "IOR_57", "IOR_59", "IOR_60"]
        for i,k in enumerate(leds):
             name = "D%d" % (i+1)
             pin = getattr(fpga, k)
             pin.rename(name).output()
             led = LED(name=name, board=self)
             m.wire(pin, led.I)
             setattr(self, name, led)

        # Buttons
        buttons = ["IOR_53", "IOR_51", "IOR_54", "IOR_52"]
        for i,k in enumerate(buttons):
             name = "S%d" % (i+1)
             pin = getattr(fpga, k)
             pin.rename(name).input()
             button = Button(name=name, board=self)
             m.wire(button.O, pin)
             setattr(self, name, button)

        # USART
        self.TX = fpga.IOR_74
        self.TX.rename('TX').output()
        self.RX = fpga.IOR_73
        self.RX.rename('RX').input()

        self.usart = FT232R(self)
        m.wire(self.TX, self.usart.RX)
        m.wire(self.usart.TX, self.TX)

        # 7 Segment Displays
        # Cathodes for digit1
        cathodes = ["IOL_2A", "IOL_2B", "IOT_93", "IOT_91", 
                    "IOT_90", "IOL_1A", "IOL_1B"]
        self.Digit0 = LEDs(len(cathodes), name='Digit0', board=self)
        for i,k in enumerate(cathodes):
             name = "Digit0[%d]" % i
             pin = getattr(fpga, k)
             pin.rename(name).output()
             m.wire(pin, self.Digit0.I[i])

        cathodes = [ "IOT_100", "IOT_99", "IOT_97", "IOT_95",
                      "IOT_94", "IOL_3B", "IOT_96"]
        self.Digit1 = LEDs(len(cathodes), name='Digit1', board=self)
        for i,k in enumerate(cathodes):
             name = "Digit1[%d]" % i
             pin = getattr(fpga, k)
             pin.rename(name).output()
             m.wire(pin, self.Digit1.I[i])

        # VGA

        # Pmod connector
        self.PMOD = [fpga.IOR_65,fpga.IOR_64,fpga.IOR_63,fpga.IOR_62,None,None,
                     fpga.IOT_78,fpga.IOT_79,fpga.IOT_80,fpga.IOT_81,None,None]


import magma as m
from loam.parts.altera.cyclone4 import EP4CE22F17C6
from loam.parts.generic.crystal import Crystal
from loam.parts.generic.button import Button
from loam.parts.generic.switch import Switch
from loam.parts.generic.led import LED
#from loam.parts.ftdi.ft232r import FT232R
#from loam.peripherals.timer import Timer
from loam import Board


class DE0Nano(Board):

    def __init__(self):
        super(DE0Nano,self).__init__("DE0Nano")

        self.fpga = fpga = EP4CE22F17C6(board=self, package='lbga256')
        m.set_mantle_target(fpga.family)

        self.CLKIN = fpga.R8
        self.CLKIN.rename('CLKIN')

        self.Crystal = Crystal(50000000, board=self)
        m.wire(self.Crystal.O, self.CLKIN.I)

        self.Clock = fpga.clock
        m.wire(self.CLKIN.O, self.Clock.I)

        #self.Timer = Timer(fpga, name='systimer')

        leds = ["A15", "A13", "B13", "A11", "D1", "F3", "B1", "L3"]
        for i,k in enumerate(leds):
             name = "D%d" % (i+1)
             pin = getattr(fpga, k)
             pin.rename(name).output()
             led = LED(name=name, board=self)
             m.wire(pin, led.I)
             setattr(self, name, led)

        # Buttons
        buttons = ["J15", "E1"]
        for i,k in enumerate(buttons):
             name = "B%d" % (i+1)
             pin = getattr(fpga, k)
             pin.rename(name).input()
             button = Button(name=name, board=self)
             m.wire(button.O, pin)
             setattr(self, name, button)

        # Switches
        switches = ["M1", "T8", "B9", "M15"]
        for i,k in enumerate(switches):
             name = "S%d" % (i+1)
             pin = getattr(fpga, k)
             pin.rename(name).input()
             switch = Switch(name=name, board=self)
             m.wire(switch.O, pin)
             setattr(self, name, switch)


        # USART
        ## self.DCD = fpga.PIO3_02
        # self.DSR = fpga.PIO3_03
        # self.DTR = fpga.PIO3_04
        # self.CTS = fpga.PIO3_05
        # self.RTS = fpga.PIO3_06
        # self.TX = fpga.PIO3_07
        # self.TX.rename('TX').output()
        # self.RX = fpga.PIO3_08
        # self.RX.rename('RX').input()

        # create usart part
        # self.usart = FT232R(board=self)
        # m.wire(self.TX, self.usart.RX)
        # m.wire(self.usart.TX, self.RX)

        self.GPIO0 = [fpga.A8, 
                 fpga.D3,
                 fpga.B8,
                 fpga.C3,
                 fpga.A2,
                 fpga.A3,
                 fpga.B3,
                 fpga.B4,
                 fpga.A4,
                 fpga.B5,
                 None,
                 None,
                 fpga.A5,
                 fpga.D5,
                 fpga.B6,
                 fpga.A6,
                 fpga.B7,
                 fpga.D6,
                 fpga.A7,
                 fpga.C6,
                 fpga.C8,
                 fpga.E6,
                 fpga.E7,
                 fpga.D8,
                 fpga.E8,
                 fpga.F8,
                 fpga.F9,
                 fpga.E9,
                 None,
                 None,
                 fpga.C9,
                 fpga.D9,
                 fpga.E11,
                 fpga.E10,
                 fpga.C11,
                 fpga.B11,
                 fpga.A12,
                 fpga.D11,
                 fpga.D12,
                 fpga.B12]

        assert len(self.GPIO0) == 40


        self.GPIO1 = [fpga.T9, 
            fpga.F13,
            fpga.R9,
            fpga.T15,
            fpga.T14,
            fpga.T13,
            fpga.R13,
            fpga.T12,
            None,
            None,
            fpga.R12,
            fpga.T11,
            fpga.T10,
            fpga.R11,
            fpga.P11,
            fpga.R10,
            fpga.N12,
            fpga.P9,
            fpga.N9,
            fpga.N11,
            fpga.L16,
            fpga.K16,
            fpga.R16,
            fpga.L15,
            fpga.P15,
            fpga.P16,
            None,
            None,
            fpga.R14,
            fpga.N16,
            fpga.N15,
            fpga.P14,
            fpga.L14,
            fpga.N14,
            fpga.M10,
            fpga.L13,
            fpga.J16,
            fpga.K15,
            fpga.J13,
            fpga.J14]

        assert len(self.GPIO1) == 40


        self.GPIO2 = [None,
            fpga.E15,
            fpga.E16,
            fpga.M16,
            fpga.A14, 
            fpga.B16,
            fpga.C14,
            fpga.C16,
            fpga.C15,
            fpga.D16,
            fpga.D15,
            fpga.D14,
            fpga.F15,
            fpga.F16,
            fpga.F14,
            fpga.G16,
            fpga.G15,
            None, # Analog5
            None, # Analog6
            None, # Analog7
            None, # Analog3
            None, # Analog2
            None, # Analog4
            None, # Analog0
            None, # Analog1
            None]

        assert len(self.GPIO2) == 26

        #ADC_CS_N = fpga.A10
        #ADC_SADDR = fpga.B10
        #ADC_SDAT = fpga.A9
        #ADC_SCLK = fpga.A14

        #I2C_SCLK = fpga.F2
        #I2C_SDAT = fpga.F1
        #G_SENSOR_INT = fpga.M2
        #G_SENSOR_CS_N = fpga.G5


from magma import *
from mantle import *

import parts.xilinx.spartan6.spartan6 as spartan6
from parts.generic.crystal import Crystal
from parts.ftdi.ft232r import FT232R
from peripherals.timer import Timer

class Mojo(Board):

    def __init__(self):
        super(Mojo,self).__init__("Mojo")

        # xc6slx9-tqg144-3

        assert FAMILY == 'spartan6'

        self.fpga = fpga = spartan6.XC6SLX9(board=self)

        self.CLKIN = fpga.P56
        self.CLKIN.rename('CLKIN')

        self.Crystal = Crystal(50000000, board=self)
        wire(self.Crystal.O, self.CLKIN.I)

        self.Clock = fpga.clock
        wire(self.CLKIN.O, self.Clock.I)

        self.Timer = Timer(fpga, name='systimer')

        self.LED1 = fpga.P134.rename('LED1').output()
        self.LED2 = fpga.P133.rename('LED2').output()
        self.LED3 = fpga.P132.rename('LED3').output()
        self.LED4 = fpga.P131.rename('LED4').output()
        self.LED5 = fpga.P127.rename('LED5').output()
        self.LED6 = fpga.P126.rename('LED6').output()
        self.LED7 = fpga.P124.rename('LED7').output()
        self.LED8 = fpga.P123.rename('LED8').output()
        #self.LED = LED(self, 8)
        #for i in range(8):
        #    C[8+i].rename("LED[%d]" % i).output()
        #    wire(C[8+i], self.LED.I[i])


        self.RST_N = fpga.P38.rename('RST_N').input()
        self.CCLK = fpga.P70.rename('CCLK').input()

        self.RX = fpga.P55
        self.RX.rename('RX').input()

        self.TX = fpga.P59
        self.TX.rename('TX').output()

        self.TXBUSY = fpga.P39
        self.TXBUSY.rename('TXBUSY').input()

        self.usart = FT232R(board=self)
        wire(self.TX, self.usart.RX)

        self.usart0 = fpga.USART(fpga)
        self.usart.peripheral(self.usart0)
        wire(self.usart0.TX, self.TX)

        # set adc channel
        #NET "spi_channel<0>" LOC = P46;
        #NET "spi_channel<1>" LOC = P61;
        #NET "spi_channel<2>" LOC = P62;
        #NET "spi_channel<3>" LOC = P65;
        # read analog value over spi
        #NET "spi_mosi" LOC = P44;
        #NET "spi_miso" LOC = P45;
        #NET "spi_ss" LOC = P48;
        #NET "spi_sck" LOC = P43;

    def main(self):
        return self.fpga.main()


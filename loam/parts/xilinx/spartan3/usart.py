from magma import *
from mantle import *
from loam import Peripheral

#from .peripherals.fifo import FIFO
#from .peripherals.uart.tx import UARTTX

class USART(Peripheral):
    name = 'usart'
    IO = ["RX", In(Bit), "TX", Out(Bit)]

    def __init__(self, fpga, name='usart0'):
        super(USART,self).__init__(fpga, name)

        self.txenable = True
        self.rxenable = False

        self.baudrate = 9600

    def baud(self, rate):
        self.baudrate = rate
        return self

    def enable(self, txenable, rxenable):
        self.txenable = txenable
        self.rxenable = rxenable
        return self

    def on(self):
        tx = self.TX.getgpio()
        tx.output().on()
        Peripheral.on(self)
        return self

    def setup(self, main):
        pass
        #assert main.FREQUENCY
        # baud=115200 of serial transfer (32 MHz / 17 = 153846 ~= 153600)
        # baud=9600 of serial transfer (32 MHz / 16 / 13 = 153846 ~= 153600)
        #baud = CascadedRing([16, 13])
        #baud = CascadedRing([14, 14, 17])
        #fifo = FIFO()
        #uart = UARTTX()

        # data, reset, write, read
        #wire(0, fifo.reset)
        #wire(uart.Tx_complete, fifo.read)

        # data, data_present, baud
        #uart(fifo.data_out, fifo.data_present, baud)
        #wire(uart.serial_out, main.TX)

        #main.TXD = fifo.data_in
        #main.TXWRITE = fifo.write
        #main.TXSTATUS = fifo.full


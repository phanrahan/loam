from crust import *

class Serial(Part):

    name = 'serial'
    basename = 'generic/serial'

    # tx is the transmit pin on the mcu
    #   that means tx should be the peripheral.RXD
    # rx is the receive pin on the mcu
    #   that means rx should be the peripheral.TXD
    def __init__(self, tx, rx, name='serial', board=None):
        Part.__init__(self, name, board)

        self.RX = Port(INPUT,  'RX', circuit=self)
        if tx:
            tx.output()
            wire(tx.O, self.RX)

        self.TX = Port(OUTPUT, 'TX', circuit=self)
        if rx:
            rx.input()
            wire(self.TX, rx.I)

        self.usart = None
        self.baudrate = 115200
        self.transmit = True
        self.receive = True

    def peripheral(self, usart):
        self.usart = usart
        return self

    def baud(self, rate):
        self.baudrate = rate
        return self

    def on(self):
        rx = self.TX.getgpio()
        tx = self.RX.getgpio()

        # find usart if not set
        if not self.usart:
            assert rx.part == tx.part
            if rx:
                assert rx.part is not None
                mcu = rx.part
            if tx:
                assert tx.part is not None
                mcu = tx.part
            # loop does not execute if no usarts are found
            for usart in mcu.find_usarts(tx, rx):
                self.usart = usart
                break

        # configure usart
        assert self.usart
        self.usart.baud(self.baudrate).wire(tx, rx).on()

        Part.on(self)

        return self

    @classmethod
    def cstruct(cls):
        s = "struct %s {\n" %cls.name
        s += "    usart_t* usart;\n"
        s += "};\n"
        return s

    def cinit(self):
        return "    %s->usart = %s;\n" %(self.c().upper(), self.usart.c().upper())

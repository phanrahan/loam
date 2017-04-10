from magma import *

class USART(Peripheral):
    name = 'usart'
    IO = ["input RX", Bit, "output TX", Bit]

    def __init__(self, fpga, name='usart0'):
        super(USART,self).__init__(fpga, name)


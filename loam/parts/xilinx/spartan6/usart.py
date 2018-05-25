from magma import *
from loam import Peripheral

class USART(Peripheral):
    name = 'usart'
    IO = ["RX", In(Bit), "TX", Out(Bit)]

    def __init__(self, fpga, name='usart0'):
        super(USART,self).__init__(fpga, name)


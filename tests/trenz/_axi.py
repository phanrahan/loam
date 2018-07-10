import sys
from magma import *
from mantle import *
from loam.boards.trenz import Trenz

trenz = Trenz()

axi_slave = trenz.axi0.slave

mmio = MMIO(axi_slave=axi,data_size=2)

data0 = mmio.data[0]
written = mmio.written[0]

add = Add(32)
data0_plus_1 = add(data0,1)

mmio.data[0].write(data=data0_plus_1,write=written)

counter = Counter(32)

compile(sys.argv[1], main)

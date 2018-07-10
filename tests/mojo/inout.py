import magma as m
from loam.boards.mojo import Mojo

mojo = Mojo()
mojo.LED1.on()
mojo.RST_N.on()

main = mojo.main()

m.wire( main.RST_N, main.LED1 )


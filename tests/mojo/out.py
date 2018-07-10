import magma as m
from loam.boards.mojo import Mojo

mojo = Mojo()
mojo.LED1.on()
mojo.LED2.on()

main = mojo.main()

m.wire( 1, main.LED1 )
m.wire( 1, main.LED2 )


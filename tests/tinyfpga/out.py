import magma as m
from loam.boards.tinyfpga import B2

b2 = B2()
b2.IOR_119.output().on()

main = b2.main()

m.wire( 1, main.IOR_119 )

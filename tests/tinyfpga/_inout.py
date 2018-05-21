from magma import wire, compile
from loam.boards.tinyfpga import B2

b2 = B2()
b2.fpga.J1.input().on()
b2.fpga.D9.output().on()

main = b2.main()

wire( main.J1, main.D9 )


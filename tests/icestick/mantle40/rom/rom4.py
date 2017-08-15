import sys
from magma import wire, compile
from loam.boards.icestick import IceStick, ROM4, A0, A1, A2, A3

icestick = IceStick()
for i in range(4):
    icestick.J1[i].input().on()
icestick.J3[0].rename('D0').output().on()

main = icestick.main()

rom = ROM4(A0&A1&A2&A3)
rom(main.J1)
wire(rom.O, main.D0)

compile(sys.argv[1], main)

from magma import wire, compile, uncurry, EndCircuit
from loam.boards.icestick import IceStick, LUT7

icestick = IceStick()
for i in range(7):
    icestick.J1[i].input().on()
icestick.J3[0].rename('D0').output().on()


main = icestick.main()

rom = uncurry(LUT7(127*[0]+[1]))
rom(main.J1)
wire(rom.O, main.D0)

EndCircuit()

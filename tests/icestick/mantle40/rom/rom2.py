from magma import wire, compile, uncurry, EndCircuit
from loam.boards.icestick import IceStick, LUT2, A0, A1

icestick = IceStick()
for i in range(2):
    icestick.J1[i].input().on()
icestick.J3[0].rename('D0').output().on()

main = icestick.main()

rom = uncurry(LUT2(A0&A1))
rom(main.J1)
wire(rom.O, main.D0)

EndCircuit()

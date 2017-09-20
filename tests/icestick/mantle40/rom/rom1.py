from magma import array, wire, compile, uncurry, EndCircuit
from loam.boards.icestick import IceStick, LUT1, A0

icestick = IceStick()
icestick.J1[0].rename('I0').input().on()
icestick.J3[0].rename('D0').output().on()

main = icestick.main()
I = array(main.I0)

rom = uncurry(LUT1(A0))
rom(I)
wire(rom.O, main.D0)

EndCircuit()

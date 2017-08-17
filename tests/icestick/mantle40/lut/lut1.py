from magma import wire, compile, EndCircuit
from loam.boards.icestick import IceStick, LUT1, A0

icestick = IceStick()
icestick.J1[0].rename('I0').input().on()
icestick.J3[0].rename('D0').output().on()

main = icestick.main()

lut = LUT1(~A0)
lut(main.I0)
wire(lut.O, main.D0)

EndCircuit()

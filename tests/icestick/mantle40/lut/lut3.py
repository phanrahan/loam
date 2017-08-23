from magma import wire, compile, EndCircuit
from loam.boards.icestick import IceStick, LUT3, A0, A1, A2

icestick = IceStick()
icestick.J1[0].rename('I0').input().on()
icestick.J1[1].rename('I1').input().on()
icestick.J1[2].rename('I2').input().on()
icestick.J3[0].rename('D0').output().on()

main = icestick.main()

lut = LUT3(A0&A1&A2)
lut(main.I0, main.I1, main.I2)
wire(lut.O, main.D0)

EndCircuit()
import magma as m
from mantle import Counter
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.DTR.on()
icestick.RTS.on()
icestick.D1.on()
icestick.D2.on()

main = icestick.main()

main.D1 <= main.DTR
main.D2 <= main.RTS

m.EndCircuit()

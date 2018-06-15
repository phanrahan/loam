import magma as m
from mantle import Counter
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.DTR.on()
icestick.RTS.on()
icestick.D1.on()
icestick.D2.on()

main = icestick.main()

m.wire( main.DTR, main.D1 )
m.wire( main.RTS, main.D2 )

m.EndCircuit()

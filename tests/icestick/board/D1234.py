import magma as m
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.D1.on()
icestick.D2.on()
icestick.D3.on()
icestick.D4.on()

main = icestick.main()

m.wire( 1, main.D1 )
m.wire( 1, main.D2 )
m.wire( 1, main.D3 )
m.wire( 1, main.D4 )

m.EndCircuit()

import magma as m
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.D5.on()

main = icestick.main()

m.wire( 1, main.D5 )

m.EndCircuit()

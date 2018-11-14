import magma as m
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.D5.on()

main = icestick.main()

main.D5 <= 1

m.EndCircuit()

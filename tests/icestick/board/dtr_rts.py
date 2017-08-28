from magma import wire, EndCircuit
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.DTR.on()
icestick.RTS.on()
icestick.D1.on()
icestick.D2.on()

main = icestick.main()

wire( main.DTR, main.D1 )
wire( main.RTS, main.D2 )

EndCircuit()

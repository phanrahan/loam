from magma import wire, compile, EndCircuit
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.D1.on()
icestick.D2.on()
icestick.D3.on()
icestick.D4.on()

main = icestick.main()

wire( 1, main.D1 )
wire( 1, main.D2 )
wire( 1, main.D3 )
wire( 1, main.D4 )

EndCircuit()

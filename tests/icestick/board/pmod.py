from magma import wire, EndCircuit
from loam.boards.icestick import IceStick

icestick = IceStick()
for i in range(4):
    icestick.PMOD0[i].input().on()
icestick.D1.on()
icestick.D2.on()
icestick.D3.on()
icestick.D4.on()

main = icestick.main()

wire( main.PMOD0[0], main.D1 )
wire( main.PMOD0[1], main.D2 )
wire( main.PMOD0[2], main.D3 )
wire( main.PMOD0[3], main.D4 )

EndCircuit()

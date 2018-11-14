import magma as m
from mantle import Counter
from loam.boards.icestick import IceStick

icestick = IceStick()
for i in range(4):
    icestick.PMOD0[i].input().on()
icestick.D1.on()
icestick.D2.on()
icestick.D3.on()
icestick.D4.on()

main = icestick.main()

main.D1 <= main.PMOD0[0]
main.D2 <= main.PMOD0[1]
main.D3 <= main.PMOD0[2]
main.D4 <= main.PMOD0[3]
#m.wire( main.PMOD0[0], main.D1 )
#m.wire( main.PMOD0[1], main.D2 )
#m.wire( main.PMOD0[2], main.D3 )
#m.wire( main.PMOD0[3], main.D4 )

m.EndCircuit()

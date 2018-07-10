from magma import wire, clock, bit, compile, EndCircuit
from loam.boards.icestick import IceStick, Register

icestick = IceStick()
icestick.Clock.on()
for i in range(4):
    icestick.J1[i].input().on()
    icestick.J3[i].output().on()
icestick.J1[4].input().on()

main = icestick.main()

reg = Register(4)
wire( clock( bit(main.CLK) & main.J1[4] ), reg.CLK ) 
wire( reg(main.J1[0:4]), main.J3 )

EndCircuit()

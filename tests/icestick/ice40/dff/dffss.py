from magma import wire, compile, EndCircuit
from loam.boards.icestick import IceStick
from mantle.lattice.ice40.PLB import SB_DFFSS

icestick = IceStick()
icestick.Clock.on()
icestick.J1[0].rename('I0').input().on()
icestick.J1[1].rename('SET').input().on()
icestick.J3[0].rename('D0').output().on()

main = icestick.main()

dff = SB_DFFSS()
wire(main.I0, dff.D)
wire(main.SET, dff.S)
wire(dff.Q, main.D0)

EndCircuit()

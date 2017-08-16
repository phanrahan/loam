from magma import wire, compile, EndCircuit
from loam.boards.icestick import IceStick
from mantle.lattice.ice40.PLB import SB_DFFESR

icestick = IceStick()
icestick.Clock.on()
icestick.J1[0].rename('I0').input().on()
icestick.J1[1].rename('CE').input().on()
icestick.J1[2].rename('RESET').input().on()
icestick.J3[0].rename('D0').output().on()

main = icestick.main()

dff = SB_DFFESR()
wire(main.I0, dff.D)
wire(main.CE, dff.E)
wire(main.RESET, dff.R)
wire(dff.Q, main.D0)

EndCircuit()

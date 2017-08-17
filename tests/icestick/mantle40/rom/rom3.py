from magma import wire, compile, EndCircuit
from loam.boards.icestick import IceStick, ROM3, A0, A1, A2

icestick = IceStick()
for i in range(3):
    icestick.J1[i].input().on()
icestick.J3[0].rename('D0').output().on()

main = icestick.main()

rom = ROM3(A0&A1&A2)
rom(main.J1)
wire(rom.O, main.D0)

EndCircuit()

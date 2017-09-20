from magma import wire, EndCircuit
from mantle import ROM
from loam.boards.icestick import IceStick

height = 5
width = 8

icestick = IceStick()
icestick.Clock.on()
for i in range(height):
    icestick.J1[i].input().on()
for i in range(width):
    icestick.J3[i].output().on()

main = icestick.main()

rom = ROM(height, width, range(1<<height))
print(rom.interface)
wire( rom(main.J1), main.J3 )

EndCircuit()


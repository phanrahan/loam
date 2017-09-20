from magma import wire, EndCircuit
from mantle import RAM
from loam.boards.icestick import IceStick

height = 2
width = 2

icestick = IceStick()
icestick.Clock.on()
for i in range(2*height+width+1):
    icestick.J1[i].input().on()
for i in range(width):
    icestick.J3[i].output().on()

main = icestick.main()

ram = RAM(height, width)
print(ram.interface)
wire( ram(main.J1[0:height],
          main.J1[height:2*height],
          main.J1[2*height:2*height+width],
          main.J1[2*height+width]),
      main.J3)

EndCircuit()


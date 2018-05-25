import magma as m
from loam.boards.de0nano import DE0Nano

nano = DE0Nano()
nano.B1.on()
nano.D1.on()

main = nano.main()

m.wire( main.B1, main.D1 )



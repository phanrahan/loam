import magma as m
from loam.boards.de0nano import DE0Nano

nano = DE0Nano()
nano.D1.on()

main = nano.main()

m.wire(1, main.D1)



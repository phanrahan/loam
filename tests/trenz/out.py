import magma as m
from loam.boards.trenz import Trenz

trenz = Trenz()
trenz.LED1.on()

main = trenz.main()
m.wire(1,main.LED1)



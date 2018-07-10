import magma as m
from loam.boards.xula2 import Xula2

xula = Xula2()
xula.PINS[0].output().on()

main = xula.main()

m.wire( 1, main.PINS )

m.EndCircuit()


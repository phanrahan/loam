import sys
from magma import wire, compile
from loam.boards.goboard import GoBoard, Counter

board = GoBoard()
board.Clock.on()
board.D1.on()

main = board.main()

counter = Counter(22)
wire(counter.O[21], main.D1)

compile(sys.argv[1], main)

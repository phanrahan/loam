from magma import wire, compile
from loam.boards.hx8kboard import HX8KBoard, Counter

board = HX8KBoard()
board.Clock.on()
board.D1.on()

main = board.main()

counter = Counter(22)
wire(counter.O[21], main.D1)

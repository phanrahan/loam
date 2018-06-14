from magma import wire, compile
from mantle import Counter
from loam.boards.goboard import GoBoard

board = GoBoard()
board.Clock.on()
board.D1.on()

main = board.main()

counter = Counter(22)
wire(counter.O[21], main.D1)


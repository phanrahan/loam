from magma import wire, compile, EndDefine
from loam.boards.hx8kboard import HX8KBoard

board = HX8KBoard()
board.D1.on()
board.D2.on()

main = board.DefineMain()

wire( 1, main.D1 )
wire( 1, main.D2 )

EndDefine()

from magma import wire, compile
from loam.boards.goboard import GoBoard

goboard = GoBoard()
goboard.D1.on()
goboard.D2.on()
goboard.D3.on()
goboard.D4.on()

main = goboard.main()

wire( 1, main.D1 )
wire( 1, main.D2 )
wire( 1, main.D3 )
wire( 1, main.D4 )

from magma import wire, compile
from loam.boards.goboard import GoBoard

goboard = GoBoard()
goboard.S1.on()
goboard.S2.on()
goboard.S3.on()
goboard.S4.on()
goboard.D1.on()
goboard.D2.on()
goboard.D3.on()
goboard.D4.on()

main = goboard.main()

wire( main.S1, main.D1 )
wire( main.S2, main.D2 )
wire( main.S3, main.D3 )
wire( main.S4, main.D4 )


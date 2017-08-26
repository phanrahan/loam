from magma import wire, bits, compile
from loam.boards.goboard import GoBoard

goboard = GoBoard()
goboard.Digit0.on()
goboard.Digit1.on()

main = goboard.main()

zero = bits(1,n=7)

wire( zero, main.Digit0 )
wire( zero, main.Digit1 )


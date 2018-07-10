import magma as m
import mantle
from loam.boards.zed import Zed

zed = Zed()
zed.LED.on(2)

main = zed.main()

m.wire( 1, main.LED[0] )
m.wire( 1, main.LED[1] )


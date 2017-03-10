import sys
from magma import *
from mantle import *
from loam.boards.zed import Zed

print("IN test out")

zed = Zed()
zed.LED.on(2)

main = zed.main()

wire( 1, main.LED[0] )
wire( 1, main.LED[1] )

compile(sys.argv[1], main)

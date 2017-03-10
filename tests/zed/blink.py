import sys
from magma import *
from mantle import *
from loam.boards.zed import Zed

zed = Zed()
zed.Clock.on()
zed.LED.on(1)

main = zed.main()

counter = Counter(32)

wire( counter.O[24], main.LED[0] )

compile(sys.argv[1], main)

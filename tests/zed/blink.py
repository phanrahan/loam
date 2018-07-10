import magma as m
import mantle
from loam.boards.zed import Zed

zed = Zed()
zed.Clock.on()
zed.LED.on(1)

main = zed.main()

counter = mantle.Counter(32)

m.wire( counter.O[24], main.LED )


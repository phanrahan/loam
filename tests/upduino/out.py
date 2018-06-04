import magma as m
from loam.boards.upduino import Upduino

up = Upduino()
up.LED_R.on()

main = up.main()

m.wire( 1, main.LED_R)

m.EndDefine()

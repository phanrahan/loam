import magma as m
import mantle
from loam.boards.mojo import Mojo

mojo = Mojo()
mojo.Clock.on()
mojo.LED1.on()

main = mojo.main()

N = 32

counter = mantle.Counter( N )

count, cout = counter()

m.wire( count[24], main.LED1 )

 

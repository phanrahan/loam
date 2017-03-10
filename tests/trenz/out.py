import sys
from magma import *
from mantle import *
from loam.boards.trenz import Trenz

trenz = Trenz()

main = trenz.main()

compile(sys.argv[1], main)

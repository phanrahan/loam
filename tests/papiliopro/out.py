import magma as m
from loam.boards.papiliopro import PapilioPro

papilio = PapilioPro()
papilio.C[8].rename('LED0').output().on()
papilio.C[9].rename('LED1').output().on()

main = papilio.main()

m.wire( 1, main.LED0 )
m.wire( 1, main.LED1 )


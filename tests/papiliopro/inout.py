import magma as m
from loam.boards.papilio import PapilioPro

papilio = PapilioPro()
papilio.C[0].rename('SWITCH0').input().on()
papilio.C[1].rename('SWITCH1').input().on()
papilio.C[8].rename('LED0').output().on()
papilio.C[9].rename('LED1').output().on()

main = papilio.main()

m.wire( main.SWITCH0, main.LED0 )
m.wire( main.SWITCH1, main.LED1 )


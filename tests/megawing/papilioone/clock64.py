import magma as m
import mantle
from loam.boards.papilioone import PapilioOne

papilio = PapilioOne()
papilio.Clock.frequency(64000000).on()
papilio.C[0].rename('SWITCH').input().on()
papilio.C[8].rename('LED').output().on()

main = papilio.main()

ff = mantle.FF()
m.wire( ff(main.SWITCH), main.LED )

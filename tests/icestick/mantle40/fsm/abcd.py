import sys
from greenery.fsm import fsm

import magma as m
from mantle import Counter
from mantle.util.debounce import debounce
from mantle.util.edge import falling
from mantle.util.fsm import DefineFSM
from loam.boards.icestick import IceStick

icestick = IceStick()
icestick.Clock.on()
for i in range(4):
    icestick.J1[i].input().on()
    icestick.J3[i].output().on()
icestick.J1[4].input().on()

main = icestick.main()

myfsm = fsm( alphabet = {'0', '1', '2', '3'}, 
             states = {'A', 'B', 'C', 'D'}, 
             initial = 'A', 
             finals = set(), 
             map = { 
                 'A': {'1': 'B'},
                 'B': {'2': 'C', '3': 'D'},
                 'C': {'3': 'D', '0': 'A'},
                 'D': {'0': 'A'},
             } )

slow = Counter(16)
select = debounce( main.J1[4], slow.COUT )
pulse = falling( select )

FSM = DefineFSM( 'ABCD', myfsm )
f = FSM()

m.wire( main.J1[0:4], f.events )
m.wire( pulse, f.CE )
m.wire( f.states,  main.J3 )


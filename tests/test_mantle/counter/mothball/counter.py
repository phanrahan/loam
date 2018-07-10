import magma as m
import mantle

if m.mantle_target == 'ice40':
    from loam.boards.icestick import IceStick
    icestick = IceStick()
    icestick.Clock.on()
    for i in range(8):
        icestick.J3[i].output().on()
    main = icestick.main()
    O = main.J3
elif m.mantle_target in ['spartan3', 'spartan6']:
    if   m.mantle_target == 'spartan3':
        from loam.boards.papilioone import PapilioOne as Papilio
    elif m.mantle_target == 'spartan3':
        from loam.boards.papiliopro import PapilioPro as Papilio
    from loam.shields.megawing import MegaWing

    megawing = MegaWing(Papilio)
    megawing.Clock.on()
    megawing.LED.on(8)
    main = megawing.main()
    O = main.LED

N = 22+8

counter = mantle.UpCounter(N)
m.wire(counter.O[N-8:N], O)

m.EndCircuit()

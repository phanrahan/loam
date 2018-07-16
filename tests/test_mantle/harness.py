import magma as m
from magma.bitutils import clog2

def main(ninputs, noutputs, input_isbits=True, output_isbits=True,
         has_clock=False):
    assert 0 <= ninputs <= 8
    assert 0 <= noutputs <= 8

    print(m.mantle_target)

    if m.mantle_target == 'ice40':
        from loam.boards.icestick import IceStick

        icestick = IceStick()

        if has_clock:
            icestick.Clock.on()

        for i in range(ninputs):
            icestick.J1[i].input().on()

        for i in range(noutputs):
            icestick.J3[i].output().on()

        top = icestick.main()

        if ninputs:
            top.I = top.J1
        if noutputs:
            top.O = top.J3

    elif m.mantle_target == 'spartan3' or m.mantle_target == 'spartan6':
        from loam.boards.papilioone import PapilioOne
        from loam.boards.papiliopro import PapilioPro
        from loam.shields.megawing import MegaWing

        Papilio = PapilioOne if m.mantle_target == 'spartan3' else PapilioPro
        megawing = MegaWing(Papilio)

        if has_clock:
            megawing.Clock.on()
        megawing.Switch.on(ninputs)
        megawing.LED.on(noutputs)

        top = megawing.main()

        if ninputs:
            top.I = top.SWITCH
        if noutputs:
            top.O = top.LED

    else:
        raise ValueError(m.mantle_target)


    if ninputs == 1 and input_isbits:
        top.I = m.bits([top.I])
    if noutputs == 1 and output_isbits:
        top.O = m.bits([top.O])

    return top


# I : In(Bits(width), O : Out(Bit)
def reduce(Test, width):
    top = main(width,1,output_isbits=False)
    test = Test(width)
    m.wire( test(top.I), top.O )
    m.EndCircuit()
    return top

# I : In(Bits(width), O : Out(Bits(width))
def unary(Test, width, 
            input_isbits=True,
            output_isbits=True,
            split_inputs=False,
            has_clock=False):

    top = main(width, width, 
           input_isbits=input_isbits,
           output_isbits=output_isbits,
           has_clock=has_clock)
    test = Test(width)
    if split_inputs:
        assert input_isbits
        m.wire( test(*[top.I[i] for i in range(width)]), top.O )
    else:
        m.wire( test(top.I), top.O )
    m.EndCircuit()
    return top

# IO : In(Bits(width), I1 : In(Bits(width)), O : Out(Bits(width))
def binary(Test, width):
    top = main(2*width, width)
    test = Test(width)
    m.wire( test(top.I[0:width], top.I[width:2*width]), top.O )
    m.EndCircuit()
    return top

# IO : In(Bits(width), .., Ih : In(Bits(width)), O : Out(Bits(width))
#   where n is height-1
def nary(Test, height, width, output_isbits=True):
    top = main(height*width, width, output_isbits=output_isbits)
    test = Test(height,width)
    if width == 1:
        m.wire( test(*[top.I[i] for i in range(height)]), top.O )
    else:
        m.wire( test(*[top.I[i*width:(i+1)*width] for i in range(height)]),
                 top.O )
    m.EndCircuit()
    return top

# IO : In(Bits(width), I1 : In(Bits(width)), O : Out(Bit)
def compare(Test, width):
    top = main(2*width,1,output_isbits=False)
    test = Test(width)
    m.wire( test(top.I[0:width], top.I[width:2*width]), top.O )
    m.EndCircuit()
    return top

# IO : In(Bits(width), I1 : In(Bits(clog2(width))), O : Out(Bits(width)
def shift(Test, width):
    logwidth = clog2(width)
    print(width, logwidth)
    top = main(width+logwidth,width)
    test = Test(width)
    print(type(test))
    m.wire( test(top.I[0:width], top.I[width:width+logwidth]), top.O )
    m.EndCircuit()
    return top

# O : Out(Bits(width))
def show(Test, width, has_clock=False):
    top = main(0, width, has_clock=has_clock)
    test = Test(width)
    out = test()
    if isinstance(out, tuple):
        out = out[0]
    m.wire( out, top.O )
    m.EndCircuit()
    return top

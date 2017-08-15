import sys
if sys.version_info < (3, 3):
    from funcsigs import signature
else:
    from inspect import signature
from magma import wire, compile
from mantle import Or, XOr, DFF, Counter
from mantle.lattice.ice40 import ROMB

# check that number of function arguments equals number of circuit inputs
def check(circuit, func):
    sig = signature(func)
    nfuncargs = len(sig.parameters)

    # count circuit inputs
    ncircargs = 0
    for name, port in circuit.interface.ports.items():
        if port.isinput(): 
            ncircargs += 1
    print(nfuncargs, ncircargs)
    assert nfuncargs == ncircargs
    return nfuncargs

def testvectors(func):
    sig = signature(func)
    nfuncargs = len(sig.parameters)

    # generate test vectors
    N = 8
    M = 4096//N
    rom = M * [0]
    for x in range(M):
        args = [(x >> i) & 1 for i in range(nfuncargs)]
        y = 1 if func(*args) else 0
        print(args, y)
        rom[x] = (y << nfuncargs) | (x & ((1 << nfuncargs)-1))
    return rom

def test(circuit, func):
    nfuncargs = check(circuit, func)
    assert nfuncargs+1 < 8

    rom = testvectors( func )

    romb = ROMB( rom )
    counter = Counter(9)
    wire( 1, romb.RE    )
    wire( 1, romb.RCLKE )
    wire( counter.O, romb.RADDR )

    circuit(*[romb.RDATA[i] for i in range(nfuncargs)])

    xor = XOr(2)
    xor(circuit.O, romb.RDATA[nfuncargs])

    orr = Or(2)
    error = DFF()
    e =  error(orr(xor.O, error.O))

    orr = Or(2)
    finished = DFF()
    f = finished(orr(counter.COUT, finished.O))

    return f, e


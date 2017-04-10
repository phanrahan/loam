import sys

if len(sys.argv) != 3:
    print('usage: python3 pll.py clkin clkout')
    sys.exit(-1)

clkin = float(sys.argv[1])
clkout = float(sys.argv[2])

assert clkin  >= 10 and clkin  <= 133
assert clkout >= 16 and clkout <= 275

print('clkin=',clkin, 'clkout=',clkout)


bestclkout = 0.
for divr in range(16):
    pfd = clkin / (divr + 1)
    if pfd < 10 or pfd > 133:
        continue

    for divf in range(64):
        vco = pfd * (divf + 1)
        if vco < 533 or vco > 1066:
            continue

        # simple mode
        for divq in range(8):
            #fout = vco / (1 << (divq+1))
            fout = vco / (1 << divq)

            if abs(fout - clkout) < abs(bestclkout - clkout):
                bestdivr = divr
                bestdivf = divf
                bestdivq = divq
                bestclkout = fout
                print('pfd=',pfd, '(divr=',bestdivr+1,')')
                print('vco=',vco, '(mulf=',bestdivf+1,')')
                print('clkout=',bestclkout, '(divq=',bestdivq,1<<bestdivq,')')


def binstr(v, n):
    s = ''
    for j in range(n):
        i = n-1-j
        s += '1' if (v >> i)&1 else '0'
    return s

def filterrange(clkin, divr, divf):
    pfd = clkin / (divr + 1)
    vco = pfd * (divf + 1)

    if   pfd <  17: range = 1
    elif pfd <  26: range = 2
    elif pfd <  44: range = 3
    elif pfd <  66: range = 4
    elif pfd < 101: range = 5
    else:           range = 6

    return range

print('divr =',binstr(bestdivr,4))
print('divf =',binstr(bestdivf,7))
print('divq =',binstr(bestdivq,3))
print('filterrange=',filterrange(clkin, bestdivr, bestdivf))


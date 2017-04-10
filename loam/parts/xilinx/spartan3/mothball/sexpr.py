import sys

LETTERS  = ""
LETTERS += "".join(map(chr,list(range(ord('a'),ord('z')+1))))
LETTERS += "".join(map(chr,list(range(ord('A'),ord('Z')+1))))
LETTERS += "".join(map(chr,list(range(ord('0'),ord('9')+1))))
LETTERS += "#_-.=<>:"
#print(LETTERS)
SPACES = " \t\n"

DIGITS = "0123456789ABCDEF"

def isnumber(s):
    if s[0:2] == '0x' or s[0:2] == '0X':
       s = s[2:]

    for i in range(0,len(s)):
        if s[i] not in DIGITS:
            return False

    return True

st = ""
nst = 0
nextst = 0

def input(s):
    global st, nst, nextst
    st = s
    nst = len(st)
    nextst = 0

def getc():
    global st, nst, nextst
    if nextst == nst:
       c = "$"
    else:
       c = st[nextst]
       nextst += 1
    return c

def ungetc():
    global st, nst, nextst
    if nextst > 0:
       nextst -= 1

EOF    = 0
LPAREN = 1
RPAREN = 2
SYMBOL = 3
NUMBER = 4

def gettoken():
    c = getc()

    #if c == '#':
    #   while getc() != '\n':
    #       pass

    while c in SPACES:
        c = getc()

    val = c

    if c == "$":
        return (EOF, "$")

    if c == '(':
        return (LPAREN, val)
    if c == ')':
        return (RPAREN, val)

    if c in LETTERS:
        c = getc()
        while c in LETTERS:
           val += c
           c = getc()
        ungetc()
        #print(val, isnumber(val))
        #if val[0].isdigit() and isnumber(val):
        #   if val[0:2] == '0X' or val[0:2] == '0x':
        #      val = int(val,16)
        #   else:
        #      val = int(val)
        return (SYMBOL, val)

    return (EOF, val)
       

def parsesexpr():

    ret = []

    t = gettoken()
    while t[0] != RPAREN:
        if t[0] == EOF:
            return []

        if t[0] == LPAREN:
            ret += [parsesexpr()]
        else:
            ret += [t[1]]
        t = gettoken()

    return ret

def parse():
    ret = []

    t = gettoken()
    while t[0] != EOF:
        if t[0] == LPAREN:
            ret += [parsesexpr()]
        else:
            ret += [t[1]]
        t = gettoken()

    return ret

if __name__ == "__main__":

    if len(sys.argv) != 2:
       print("usage: python sexpr.py file.sexpr")

    input("".join(open(sys.argv[1]).readlines()))

    #t = gettoken()
    #while t[0] != EOF:
    #    print(t)
    #    t = gettoken()

    print(parse())

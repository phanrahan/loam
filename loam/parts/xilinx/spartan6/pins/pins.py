import os
import sys

def readpins(part,package):
    #dir = os.path.join(os.path.dirname(__file__), 'tables')
    #filename = os.path.join(dir,package+'_pinout.csv')
    filename = part+package+'pkg.txt'

    input = open(filename)
    output = open(part+package+'.csv','w')

    header = input.readline()
    #print(header)
    print("N,PIN,NAME,TYPE,BANK", file=output)
    for line in input.readlines():
        data = line.split()
        pin = data[0][1:]
        print("%s,%s,%s,%s,%s" % (pin, data[0], data[3], data[3], data[1]), file=output)

part = '6slx9'
package = 'tqg144'
readpins(part,package)

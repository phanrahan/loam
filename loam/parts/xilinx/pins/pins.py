import os
import csv

def readpins(package):
    dir = os.path.join(os.path.dirname(__file__), 'tables')
    filename = os.path.join(dir,package+'_pinout.csv')

    f = open(filename)
    row = csv.reader(f)

    header = row.next()
    #print(header)
    for data in row:
        #if data[3] == 'I/O' or data[3].startswith('DUAL'):
        if data[3] == 'I/O':
            print(data[1])

readpins('vq100')

import os
import csv

def readpins(package):
    #dir = os.path.join(os.path.dirname(__file__), 'tables')
    #filename = os.path.join(dir,package+'_pinout.csv')
    filename = package+'_pinout.csv'

    f = open(filename)
    row = csv.reader(f)

    header = row.next()
    #print(header)
    #SORT_PIN,PIN_NUMBER,
    #XC3S100E_PIN,XC3S100E_TYPE,
    #XC3S250E_PIN,XC3S250E_TYPE,
    #BANK,DIFFERENCE
    print("N,PIN,NAME,TYPE,BANK")
    for data in row:
        # XC3S100E
        #print("%s,%s,%s,%s,%s" % (data[0], data[1], data[2], data[3], data[6]))
        # XC3S250E
        print("%s,%s,%s,%s,%s" % (data[0], data[1], data[4], data[5], data[6]))

readpins('vq100')

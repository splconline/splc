"""
Takes a .csv file 'input.csv' with format:

    <Date>,<Amount>,<Narration>

And converts it into .qif 'output.qif'
"""

import csv

qiffile = open('output.qif','w')
qiffile.write('!Type:Bank' + '\n')

with open('input.csv', newline='') as csvfile:
    txfile = csv.reader(csvfile)
    for row in txfile:
        qiffile.write('D' + row[0] + '\n')
        qiffile.write('T' + row[1] + '\n')
        qiffile.write('P' + row[2] + '\n')
        qiffile.write('^' + '\n')

csvfile.close
qiffile.close
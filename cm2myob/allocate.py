import pandas as pd

def allocate(notes,cost):
    if notes.find('Membership') != -1:
        if cost == 15:
            return 'Term Membership'
        else:
            return 'Membership' 
#       endif
    else:
#        return notes.str.extract(r'\((.*?)\)', expand=False)
         return notes[notes.find("(")+1:notes.find(")")]        
        
print(allocate("blah Membership blah",15))

print(allocate("blah blah blah (CA15) blah blah", 360))

print(allocate("blah Membership blah", 40))
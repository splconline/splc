#!/usr/bin/env python
# coding: utf-8

import pandas as pd
from pathlib import Path

input_file = Path.cwd()/'course_income.csv'

df = pd.read_csv(input_file)

# Lose unwanted columns

df.drop(['Day', 'Start',
       'Tot-Stus', 'Concession-Stus', 'CM Fee',
       'Concession Fee','Total Income'], axis=1, inplace=True)

# Make the '$1,200' strings numeric

df['Operating Fee']=df['Operating Fee'].str.lstrip('$')
df['Operating Fee']=df['Operating Fee'].str.replace(',','')
df['Operating Fee']=pd.to_numeric(df['Operating Fee'])

# While you're there, fix the dates too

df['First Session'] = pd.to_datetime(df['First Session'])

# Add required blank columns, then reorder all the columns

df['Category']=""
df['Facilitator']=""
df=df[['Category','Code','Course', 'Facilitator' , 'First Session','Sessions', 'Operating Fee']]

# Populate the category field (which is just the Code field stripped of digits)

df['Category'] = df['Code'].replace('(\d+)','',regex=True)

# Sort by start date and course name, ready to populate #weeks/month 

df=df.sort_values(['Category','Course'])

# Export

df.to_csv('hurrah.csv',index=False)


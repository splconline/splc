#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
from pathlib import Path
input_file = Path.cwd()/'enrolments_all.csv'
df = pd.read_csv(input_file)


# In[2]:


df['Email'] = df.Email.map(str) + ";"


# In[3]:


df.drop(['Title', 'Given', 'Surname', 'Mem_num', 'Street', 'Suburb', 'State',
       'PostC', 'Phone', 'Mobile', 'Status', 'Paid', 'Creche',
       'Notes'], axis=1, inplace=True)


# In[4]:


df.to_csv('hurrah.csv',index=False)


# In[ ]:





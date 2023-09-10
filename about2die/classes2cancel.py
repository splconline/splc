#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
from pathlib import Path
input_file = Path.cwd()/'course_history.csv'
df = pd.read_csv(input_file)


# In[2]:


df.columns


# In[3]:


df.drop(['Run Time','Quota','Members', 'Non-members', 'Waiting',
       'Operating Cost'], axis=1, inplace=True)


# In[4]:


df['Session'] = pd.to_datetime(df['Session'])


# In[5]:


dying = df['Students'] < df['Min Quota']


# In[6]:


df = df[dying].sort_values('Session')


# In[7]:


html = df.to_html(index=False)
text_file = open("index.html", 'w')
text_file.write(html)
text_file.close()


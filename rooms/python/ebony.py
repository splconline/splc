#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
from pathlib import Path
input_file = Path.cwd()/'room_details.csv'
df = pd.read_csv(input_file)


# In[2]:


df.columns=[c.lower() for c in df.columns]


# In[3]:


df.drop(['charge_type','discount','additional_charges'], axis=1, inplace=True)


# In[4]:


# df.head()


# In[5]:


# pd.set_option('display.max_rows', 100)


# In[6]:


df['date'] = pd.to_datetime(df['date'])


# In[7]:


# df.info()


# In[8]:


# df.head()


# In[9]:


df = df.sort_values(['day','room','time'])


# In[10]:


# df


# In[11]:


df.to_csv('hurrah.csv',index=False)


# In[ ]:

#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
from pathlib import Path


# In[2]:


input_file = Path.cwd()/'course_history.csv'


# In[3]:


df = pd.read_csv(input_file)


# In[4]:


df


# In[5]:


df.columns


# In[6]:


df.drop(['Facilitator', 'Session', 'Time', 'Weeks', 'Run Time',
       'Min Quota', 'Quota', 'Students', 'Members', 'Non-members', 'Waiting',
       'Operating Cost'], axis=1, inplace=True)


# In[7]:


df


# In[8]:


df.to_csv('hurrah.tab',index=False, sep='\t')


# In[9]:


html = df.to_html(index=False)
text_file = open("index.html", "w")
text_file.write(html)
text_file.close()


# In[ ]:





#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
from pathlib import Path


# In[2]:


input_file = Path.cwd()/'course_income.csv'


# In[3]:


df = pd.read_csv(input_file)


# In[4]:


df


# Lose unwanted columns

# In[5]:


df.drop(['Day', 'Start',
       'Tot-Stus', 'Concession-Stus', 'CM Fee',
       'Concession Fee','First Session','Sessions','Operating Fee','Credit Used'], axis=1, inplace=True)


# In[6]:


df


# Add the 'Category' field, then reorder the fields

# In[7]:


df['Category']=""
df=df[['Category','Code','Course','Total Income']]


# In[8]:


df


# Populate the category field with the course category code (e.g. AC13 course category code is AC)

# In[9]:


df['Category'] = df['Code'].replace('(\d+)','',regex=True)


# In[10]:


df


# Sort the same was as the New Term Prepaid/Accrual is sorted

# In[11]:


df=df.sort_values(['Category','Course'])


# In[12]:


df


# In[13]:


df.info()


# In[14]:


df.to_csv('hurrah.csv',index=False)


# In[ ]:





# In[ ]:





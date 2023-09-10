#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
from pathlib import Path
input_file = Path.cwd()/'enrolments_all.csv'


# Read the dataframe, forcing the 'Phone' and 'Mobile' fields to be strings instead of int (so that 0413649692 doesn't become 413649692)

# In[2]:


df = pd.read_csv(input_file, dtype={'Phone': object,'Mobile':object})


# In[3]:


df.columns


# Get rid of the fields that the teacher doesn't need

# In[4]:


#df.drop(['Title','Mem_num', 'Street', 'Suburb', 'State',
#       'PostC', 'Status', 'Paid', 'Creche',
#       'Notes'], axis=1, inplace=True)

df.drop(['Title','Mem_num', 'Street', 'Suburb', 'State',
       'PostC', 'Status', 'Paid', 'Creche',
       'Notes','Phone','Mobile'], axis=1, inplace=True)


# In[5]:


df=df.fillna("")


# Export to HTML

# In[6]:


html = df.to_html(index=False)
text_file = open("index.html", "w")
text_file.write(html)
text_file.close()

df.to_csv("splc-14.06.2023.csv", index=False)


# In[ ]:





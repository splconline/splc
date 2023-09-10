#!/usr/bin/env python
# coding: utf-8
#
# .py version of the cm2myob repo notebook as of 17.05.2021
#
# In[1]:


import pandas as pd
from pathlib import Path
input_file = Path.cwd()/'receipts.csv'
df = pd.read_csv(input_file)


# ## Remove unwanted columns, add blank column and reorder

# In[2]:


df.drop(['Given', 'Surname','Income','GST',], axis=1, inplace=True)


# In[3]:


df["Cumulative"] = ""


# In[4]:


df=df[['Number', 'Paid by', 'Date', 'Paid','Cumulative','Type', 'Payment_Type','Issued_By', 'Merchant Ref', 'Notes']]


# In[5]:


df.head()


# ## Filter out non-credit card transactions
# Now for the Boolean indexing. The rows we want to remove are 'Deposit'/'Saved' (from the Type column) and 'cash, 'EFT'/'cash' (from the Payment_Type) column. Constructing the Boolean index:

# In[6]:


cash = df['Payment_Type']=='cash'
cheque = df['Payment_Type']=='cheque'
saved = df['Type']=='Saved'
eft = df['Payment_Type']=='EFT'
deposit = df['Type']=='Deposit'


# And now apply and export:

# In[7]:


df[~(cash|cheque|eft|saved|deposit)].to_csv('hurrah.csv',index=False,header=False)


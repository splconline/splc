#!/usr/bin/env python
# coding: utf-8

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


# Add the column `Allocate` to contain MYOB allocation information

# In[6]:


df['MYOB Narration']=""


# Populate Allocate with the course code or membership type

# In[7]:


def myobnarr(notes,cost):
    if "Membership" in notes:
        if cost == 15.0:
            return 'Term Membership'
        else:
            return 'Membership' 
    else:
        return notes[notes.find("(")+1:notes.find(")")]


# In[8]:


df['MYOB Narration'] = df.apply(lambda x: myobnarr(x['Notes'], x['Paid']), axis=1)


# In[9]:


# For the record, this is what we used to do without a lambda function and thus not dealing with membership


# In[10]:


#df['Allocate'] = df['Notes'].str.extract(r'\((.*?)\)', expand=False)


# Check results

# In[11]:


df.head()


# For the record, here is how to strip the digits, maybe in the future we can specify allocation

# In[12]:


# df['Allocate'] = df['Allocate'].replace('(\d+)','',regex=True)


# In[13]:


df


# ## Filter out non-credit card transactions
# Now for the Boolean indexing. The rows we want to remove are 'Deposit'/'Saved' (from the Type column) and 'cash, 'EFT'/'cash' (from the Payment_Type) column. Constructing the Boolean index:

# In[14]:


cash = df['Payment_Type']=='cash'
cheque = df['Payment_Type']=='cheque'
saved = df['Type']=='Saved'
eft = df['Payment_Type']=='EFT'
deposit = df['Type']=='Deposit'
zero = df['Paid']==0

# And now apply and export:

# In[15]:


df[~(cash|cheque|eft|saved|deposit|zero)].to_csv('hurrah.csv',index=False,header=False)


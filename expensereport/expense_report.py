import pandas as pd
from pathlib import Path
import re

input_file=Path.cwd()/'CSVData.csv'
input_file2=Path.cwd()/'CSVData(1).csv'

def add_notes(file):
    df=pd.read_csv(file, header=None)
    df2=df.iloc[:, :3]
    df2.columns=["Date", "Amount", "Narration"]

    #rearrange order of columns
    df2=df2[["Date", "Narration", "Amount"]]

    notes=[]
    keywords={"MYOB":"MYOB subscription", "Dodo":"Telephone", "MERCHANT FEE":"Merchant banking fee", 
            "Didi":"Didi wage", "Danielle":"Danielle wage", "Aldimobile":"Broadband for resale", "Amaysim":"Broadband for resale", 
            "Calendly":"Be Connected booking system", "WESTNET":"Email hosting", "DUX":"Staff lunch",
            "Google":"Movie rental for course material"}

    # append the notes associated to the keyword if the narration contains any of the keywords in the dictionary,
    # otherwise append a blank space.
    for i in range(df2.shape[0]):
        old_length=len(notes)
        for keyword in keywords:
            matched_keyword=re.search(keyword, df2.iloc[i,1], flags=re.IGNORECASE)
            if matched_keyword is not None:
                notes.append(keywords[keyword])
        new_length=len(notes)
        if new_length == old_length:
            notes.append("")

    #add a new colum notes and populate its rows with the list above
    df2["Notes"]=notes

    #writes the dataframe to a csv file
    if file==input_file:
        df2.to_csv("report_1.csv", index=False, header=False)
    elif file==input_file2:
        df2.to_csv("report_2.csv", index=False, header=False)

add_notes(input_file)
add_notes(input_file2)
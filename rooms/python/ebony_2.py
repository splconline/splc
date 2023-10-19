import pandas as pd
from pathlib  import Path

input_file = Path.cwd()/'room_details.csv'
df = pd.read_csv(input_file)

df.columns=[c.lower() for c in df.columns]

df.drop(['charge_type','discount','additional_charges'], axis=1, inplace=True)

df['date'] = pd.to_datetime(df['date'])

days_dict={"Saturday":1, "Monday":2, "Tuesday":3, "Wednesday":4, "Thursday":5, "Friday":6}
daynum=[]
for day in df['day']:
    daynum.append(days_dict[day])

df["daynum"]=daynum
df = df.sort_values(['daynum','room','time'])
df.drop(['daynum'], axis=1, inplace=True)

df.to_csv('rooms.csv',index=False)
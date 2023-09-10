#Copies room_details.csv from Downloads to current directory then 
#executes the python script

mv ~/Downloads/room_details.csv $PWD
python3 ebony_2.py

#Copies receipts.csv from Downloads to current directory then 
#executes the python script

mv ~/Downloads/course_history.csv $PWD
python3 courselist.py

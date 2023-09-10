#Copies receipts.csv from Downloads to current directory then 
#executes the python script

mv ~/Downloads/course_income.csv $PWD
python3 newterm.py

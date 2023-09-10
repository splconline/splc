#Copies receipts.csv from Downloads to current directory then 
#executes the python script

mv ~/Downloads/enrolments_all.csv $PWD
python3 email-list-outlook.py

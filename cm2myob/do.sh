#Copies receipts.csv from Downloads to current directory then 
#executes the python script

mv ~/Downloads/receipts.csv $PWD
python3 cm2myob.py

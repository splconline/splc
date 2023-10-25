# Monthly Expense Report

Takes monthly expense transactions from Commonwealth Bank transaction export, swaps the columns, adds a column and tries to populate that column according to common transaction keywords. 

## How to Use

1. Export from the Commonwealth Bank, the output from CBA will be `CSVData.csv` and `CSVData.csv(1)`.

2. Put both these transaction export files into the same file as the `expense_report.py` file.

3. Run by typing `python3 expense_report.py`. Output files will be `report_1.csv` and `report_2.csv`.

4. Put `report_1.csv` and `report_2.csv` in the [Utility Scratch Spreadsheet](https://docs.google.com/spreadsheets/d/1151-Vibd-RE36G9TUSpHQiPFfU5IJ3GOR-k56qIQIrA/edit#gid=2063414313) Google Sheet (starting from cell A4 and leaving three blank rows in between - you'll thank me later), then run the `FormatHeading` script (available in the Macros menu).

5. Fill in the rest of the `Notes` column by looking at Purchases -> Bills in MYOB.

6. 

## To Do

Need to format column C as currency.
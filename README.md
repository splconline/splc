# splc-scripts
A collection of scripts to automate processes at the [South Perth Learning Centre](splc.org.au). All are written as Jupyter notebooks, some have been converted to Python scripts for convenience.

Most scripts parse data from [Class Manager](classmanager.com.au) class management software for various purposes.

## Contents

### about2die
Generates a list of classes that are in danger of cancellation due to lack of enrolments, so we can focus marketing efforts on these.

### artauction
A simple generic lookup script to look up email addresses.

### beconnected
Keeps track of how many 2021 signups occured that were not people who signed up in 2020 (who therefore count towards the Be Connected grant)

### cm2myob
**cm2myob.py**: Filters out the transactions that are not Merchant Banking transactions, then adds a column in which you can manually identify constituent transactions for a given day's Merchant Banking total. Also extracts the course code into its own column.

**csvtoqif.py**: Experimental .csv to .qif converter. The idea is to convert ClassManager .csv output into .qif, ready for import into MYOB as a 'bank statement'. From there we reconcile, should save us data entry into Receive Money transactions.

### courselist
Generates a course list because previously receipts did not always contain course codes (course codes need to be entered into MYOB). No longer required because now receipts always contain course codes.

### klcec
Generates a per class list from a chronological list of room hires.

### mailchimp
A simple generic grouping script that extracts unique emails from a ClassManager persons export. Can't remember why I need this TBH.

### studentlist
Generates a class list of students, either just email addresses for copy-pasting into Outlook (because Outlook only works with ';' as separator) or full contact details for facilitators.

### termreport
Reformats the term financial report generates by ClassManager.

### cm-myob-error-check
Parses the GST detailed report to prepare for ClassManager - MYOB error checking. Deletes some columns here, some columns there such that what remains is what is required.



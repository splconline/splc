# filterRows() Function

The `filterRows()` function is a Google Apps Script function that performs data filtering and manipulation operations on a Google Sheets spreadsheet.

## Functionality

The `filterRows()` function performs the following tasks:

1. Clears the header row and deletes it.
2. Deletes unnecessary columns from the sheet.
3. Inserts a blank column before a column F.
4. Retrieves the range and values of the sheet.
5. Modifies values in a newly created column called "Notes" to define the type of transaction (Course, membership or credit).
6. Deletes rows where paid == 0 or 
type is not (Income/used/Refund) or 
Payment type is not (credit card/credit account)

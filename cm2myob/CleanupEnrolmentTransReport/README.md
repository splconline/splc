# deleteRowsAndColumns() Function

The `deleteRowsAndColumns()` function is a Google Apps Script function that performs data manipulation and formatting operations on a Google Sheets spreadsheet.

This code is used to delete all the unnecessary	data before the columns and keeps only the total at the end and finally sorts it by Account No.

## Functionality

The `deleteRowsAndColumns()` function performs the following tasks:

1. Retrieves the active sheet in the spreadsheet.
2. Retrieves the values from the entire data range of the sheet.
3. Determines the start and end row indices based on specific values ("Account No." and "Total") in the first column.
4. Deletes rows above "Account No." and below "Total".
5. Calls a separate function named `Untitledmacro()` (not included in the provided code).
6. Sorts column A in ascending order.
7. Moves rows with "Account No." to the top of the sheet.
8. Makes the first row bold.
9. Deletes the second-last row in the sheet.
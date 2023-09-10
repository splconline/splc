# processColumns() Function

The `processColumns()` function is a Google Apps Script function that performs data processing and manipulation operations on a Google Sheets spreadsheet like removing leading spaces, replacing "," and "@" with newline.

## Functionality

The `processColumns()` function performs the following tasks:

1. Retrieves the active sheet in the spreadsheet.
2. Retrieves the range and values of the sheet.
3. Iterates through each row in the values array.
4. Processes the third and fourth columns of each row:
   - Removes leading whitespace from the third column value.
   - Checks if the third column value contains a comma and replaces it with the first part before the comma.
   - Checks if the fourth column value contains an "@" symbol and replaces it with a newline character ("\n").
5. Clears the sheet contents.
6. Sets the updated values in the sheet.

# deleteNonSaturdayRowsAndSetHeader() Function

The `deleteNonSaturdayRowsAndSetHeader()` function is a Google Apps Script function that performs data manipulation and formatting operations on a Google Sheets spreadsheet.

This code sets the schedule only for SATURDAY such that all other days are deleted, it adds in a header and make font size bigger as well. 

## Functionality

The `deleteNonSaturdayRowsAndSetHeader()` function performs the following tasks:

1. Retrieves the active sheet in the spreadsheet.
2. Gets the values from the entire data range of the sheet.
3. Deletes rows that do not have "Saturday" in the first column.
4. Sets the font size for the entire table to 11.
5. Creates a header with the day of the week and date based on the first "Saturday" row.
6. Inserts two rows at the beginning of the sheet and sets the header text.
7. Formats the header range with merged cells, bold font weight, and increased font size.
8. Deletes the first two columns (A and B).
9. Sets font weight to bold and underline for row 3.
10. Sets horizontal alignment to left for columns A and B.
11. Sets horizontal alignment to center for the range A1:F2.
12. Trims the left side of string values in column C.
13. Updates the values in column C with the trimmed values.
# deleteChargeRows() Function

The `deleteChargeRows()` function is a Google Apps Script function that performs data manipulation and cleanup operations on a Google Sheets spreadsheet.

## Functionality

The `deleteChargeRows()` function performs the following tasks:

2. Sets the number format for column C to 'yyyy-mm-dd'.
3. Sorts the rows on the Day column (Column B) in a specific order such that              Saturday is first followed by weekdays till Sunday.
4. Sets the updated values in the sheet after sorting.
5. Deletes three columns (Charge_Type, Discount, and Additional_Charges) from the sheet.
6. Calls another macro named `sort_room_time()` for further sorting room and then time


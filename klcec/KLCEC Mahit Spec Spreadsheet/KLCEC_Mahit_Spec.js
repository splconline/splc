function deleteChargeRows() {
  // Get the active sheet
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();

  // Get the range of data in the sheet
  var dataRange = sheet.getDataRange();

  // Get the values within the data range
  var values = dataRange.getValues();

  // Get the active spreadsheet
  var spreadsheet = SpreadsheetApp.getActive();

  // Set the number format for column C to 'yyyy-mm-dd'
  spreadsheet.getRange('C:C').activate();
  spreadsheet.getActiveRangeList().setNumberFormat('yyyy"-"mm"-"dd');

  // Define an array of days of the week in the order having "Saturday" at the start.
  var days = ['Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

  // Sort the rows based on the Day column (Column B)
  values.sort(function(a, b) {
    var dayA = a[1]; // Assuming the Day column is the second column (index 1)
    var dayB = b[1];
    return days.indexOf(dayA) - days.indexOf(dayB);
  });

  // Get the last row and last column of the sheet
  var lastRow = sheet.getLastRow();
  var lastColumn = sheet.getLastColumn();

  // Clear the sheet contents
  sheet.clearContents();

  // Set the updated values with lines
  sheet.getRange(1, 1, values.length, values[0].length).setValues(values);

  // Delete the column for Charge_Type, Discount, and Additional_Charges
  sheet.deleteColumns(6, 3);

  sort_room_time(); // Call another function for further sorting with first rooms then time
}

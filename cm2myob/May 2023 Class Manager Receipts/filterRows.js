function filterRows() {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();

  // Clear the header row
  var headerRow = sheet.getRange(1, 1, 1, sheet.getLastColumn());
  headerRow.clear();
  sheet.deleteRow(1);

  // Columns to delete (B, C, G, H)
  var columnsToDelete = [2, 3, 7, 8];
  
  // Delete specified columns
  for (var i = columnsToDelete.length - 1; i >= 0; i--) {
    var column = columnsToDelete[i];
    sheet.deleteColumn(column);
  }
  
  // Insert a blank column before column F
  var blankColumnIndex = 5; // Index of column E (before F)
  sheet.insertColumnBefore(blankColumnIndex);
  
  // Get the range and values of the sheet
  var dataRange = sheet.getDataRange();
  var values = dataRange.getValues();

  // Get the index of the newly created column
  var newColumnIndex = sheet.getLastColumn() + 1;
  
  // Process each row in reverse order
  for (var i = values.length - 1; i >= 0; i--) {
    var lastColumnValue = values[i][9]; // Value in the last column (index 9)
    var dValue = values[i][3]; // Value in column D (index 3)
    
    if (lastColumnValue.indexOf("Membership") === 0 && dValue == 15) {
      sheet.getRange(i + 1, newColumnIndex).setValue("Term Membership");
    } else if (lastColumnValue.indexOf("Membership") === 0) {
      sheet.getRange(i + 1, newColumnIndex).setValue("Membership");
    } else if (lastColumnValue.includes("(") && lastColumnValue.includes(")")) {
      var extractedValue = lastColumnValue.match(/\((.*?)\)/)[1];
      sheet.getRange(i + 1, newColumnIndex).setValue(extractedValue);
    } else if (lastColumnValue.includes("adjustment taken")) {
      sheet.getRange(i + 1, newColumnIndex).setValue("credit used");
    } else {
      sheet.getRange(i + 1, newColumnIndex).setValue(lastColumnValue);
    }
  }

  // Delete rows that meet certain conditions
  for (var i = values.length - 1; i >= 1; i--) {
    var dValue = values[i][3]; // Value in column D (index 3)
    var fValue = values[i][5]; // Value in column F (index 5)
    var gValue = values[i][6]; // Value in column G (index 6)
    
    if (dValue === 0 || (fValue !== "Income" && fValue !== "Refund" && fValue !== "Used") || (gValue !== "credit card" && gValue !== "credit account")) {
      sheet.deleteRow(i + 1);
    }
  }
}

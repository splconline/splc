function processColumns() {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var dataRange = sheet.getDataRange();
  var values = dataRange.getValues();

  // Iterate through each row
  for (var i = 0; i < values.length; i++) {
    var row = values[i];
    var thirdColumnValue = row[2]; // Assuming the third column is at index 2
    var fourthColumnValue = row[3]; // Assuming the fourth column is at index 3
    
    // Remove leading space from the third column
    row[2] = thirdColumnValue.trimLeft();

    // Check and replace commas in the third column
    if (thirdColumnValue.indexOf(',') !== -1) {
      var newValue = thirdColumnValue.split(',')[0];
      row[2] = newValue.trim();
    }

    // Check and replace "@" symbols with newline in the fourth column
    var regex = /@(\s|$)/g;
    if (regex.test(fourthColumnValue)) {
      var newValue = fourthColumnValue.replace(regex, '\n');
      row[3] = newValue;
    }
  }

  // Clear the sheet and set the updated values
  sheet.clearContents();
  sheet.getRange(1, 1, values.length, values[0].length).setValues(values);
}

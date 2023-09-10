function deleteNonSaturdayRowsAndSetHeader() {
  // Get the active sheet
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();

  // Get the values from the entire data range of the sheet
  var data = sheet.getDataRange().getValues();

  // Initialize variables
  var header = '';
  var saturdayRows = [];

  // Loop through the data starting from the last row (excluding header)
  for (var i = data.length - 1; i >= 1; i--) {
    var day = data[i][0].toString().toLowerCase();

    // Check if the day in the first column is 'saturday'
    if (day === 'saturday') {
      // If it is 'saturday', add the row to the saturdayRows array
      saturdayRows.unshift(data[i]);
    } else {
      // If it is not 'saturday', delete the row from the sheet
      sheet.deleteRow(i + 1);
    }
  }

  // Get the range for the entire table
  var tableRange = sheet.getRange(1, 1, sheet.getLastRow(), sheet.getLastColumn());
  // Increase font size for the entire table
  tableRange.setFontSize(11);

  // Check if there are any 'saturday' rows
  if (saturdayRows.length > 0) {
    var firstSaturdayRow = saturdayRows[0];
    var dayOfWeek = firstSaturdayRow[0].toString();
    var date = formatDate(firstSaturdayRow[1]);

    // Create the header text using the day of the week and date
    header = dayOfWeek + ', ' + date;

    // Insert two rows at the beginning of the sheet
    sheet.insertRowsBefore(1, 2);
    // Get the range for the header (two rows, starting from column 3)
    var headerRange = sheet.getRange(1, 3, 2, 6);
    // Merge the cells in the header range and set the header value
    headerRange.merge().setValue(header);
    // Apply bold font weight to the header range
    headerRange.setFontWeight('bold');
    // Increase font size for the header range
    headerRange.setFontSize(20);
  }

  // Delete the first two columns (A and B)
  sheet.deleteColumns(1, 2);

  // Set font weight to bold and underline for row 3
  sheet.getRange('3:3').setFontWeight('bold').setFontLine('underline');

  // Set horizontal alignment to left for columns A and B
  sheet.getRange('A:B').setHorizontalAlignment('left');

  // Set horizontal alignment to center for range A1:F2
  sheet.getRange('A1:F2').setHorizontalAlignment('center');

  // Iterate over values in column C and trim the left side
  var columnCRange = sheet.getRange('C3:C' + sheet.getLastRow());
  var columnCValues = columnCRange.getValues();
  for (var i = 0; i < columnCValues.length; i++) {
    var value = columnCValues[i][0];
    if (typeof value === 'string') {
      // Trim the left side of string values
      columnCValues[i][0] = value.trimLeft();
    }
  }
  // Update the values in column C with the trimmed values
  columnCRange.setValues(columnCValues);
}

function formatDate(date) {
  var options = { year: 'numeric', month: 'short', day: 'numeric' };
  return date.toLocaleDateString('en-US', options);
}
``

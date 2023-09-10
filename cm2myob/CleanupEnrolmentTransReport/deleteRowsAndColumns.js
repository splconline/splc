function deleteRowsAndColumns() {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var data = sheet.getDataRange().getValues();
  var spreadsheet = SpreadsheetApp.getActive();

  // Determine the start and end row indices
  var startRowIndex = 0;
  var endRowIndex = data.length - 1;

  for (var i = 0; i < data.length; i++) {
    if (data[i][0] == "Account No.") {
      startRowIndex = i;
      break;
    }
  }

  for (var j = startRowIndex + 1; j < data.length; j++) {
    if (data[j][0] == "Total") {
      endRowIndex = j + 1;
      break;
    }
  }

  // Delete rows above "Account No." and below "Total"
  sheet.deleteRows(endRowIndex + 1, data.length - endRowIndex);
  sheet.deleteRows(1, startRowIndex);

  // Call the Untitledmacro function
  Untitledmacro(sheet);

  // Sort column A in ascending order
  spreadsheet.getRange('A2:A').activate();
  spreadsheet.getActiveSheet().sort(1, true);

  // Move rows with "Account No." to the top
  var newData = sheet.getDataRange().getValues();
  var accountNoRows = [];

  for (var k = 0; k < newData.length; k++) {
    if (newData[k][0] == "Account No.") {
      accountNoRows.push(newData.splice(k, 1)[0]);
      k--;
    }
  }

  sheet.insertRowsBefore(1, accountNoRows.length);
  sheet.getRange(1, 1, accountNoRows.length, accountNoRows[0].length).setValues(accountNoRows);

  // Make the first row bold
  var firstRow = sheet.getRange(1, 1, 1, sheet.getLastColumn());
  firstRow.setFontWeight("bold");

  // Delete the second last row
  var lastRowIndex = sheet.getLastRow();
  var secondLastRowIndex = lastRowIndex - 1;
  sheet.deleteRow(secondLastRowIndex);
}

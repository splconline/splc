/** @OnlyCurrentDoc */

// To use, load the MYOB 'GST detailed report' for the month into a new sheet,
// then run this function
// Update December 2022: MYOB Essentials just upgraded, so need to review 

function ProcessErrorChecking() {
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getSheets()[1];

// get the integer of the bottom of the spreadsheet
  var lastRow = sheet.getLastRow();

// get the range for the first column
  var colOne = sheet.getRange(1,1,lastRow);

// Put it in a data array
  var data=colOne.getValues();
  
// Loop from column heading (i.e. row 6, index 5) until you hit an empty cell

  var i = 5;
  while (data[i][0] != "") {
    i++;
  };

// Delete the unneeded data rows
  sheet.deleteRows(i+1,lastRow-i);

// Delete the unneeded header rows
  sheet.deleteRow(7);
  sheet.deleteRows(1,5);

// Delete the unneeded columns
  sheet.deleteColumns(7,2);
  sheet.deleteColumn(3);

// Sort by what is now column 3 ('Account')
  finalRange = sheet.getRange(2,1,i-6,5);
  finalRange.sort(3);
};

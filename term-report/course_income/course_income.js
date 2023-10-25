/** @OnlyCurrentDoc */

function delete_replace_profit_sort_function() {
  var spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = spreadsheet.getActiveSheet();

  // Delete columns D, E, H, I, K
  sheet.deleteColumns(11); // Column K
  sheet.deleteColumns(9); // Column I
  sheet.deleteColumns(8); // Columns H
  sheet.deleteColumns(5); // Column E
  sheet.deleteColumns(4); // Column D

  // Move column G to the sixth position
  sheet.moveColumns(sheet.getRange('G:G'), 6);

  // Add a column named "Profit"
  sheet.getRange('H1').setValue('Profit');

  // Calculate the values of total income - expenditure and put it in "Profit" column
  var spreadsheet = SpreadsheetApp.getActive();
  spreadsheet.getRange('H2').activate();
  spreadsheet.getCurrentCell().setFormula('=F2-G2');
  spreadsheet.getRange('H2').activate();
  spreadsheet.getActiveRange().autoFillToNeighbor(SpreadsheetApp.AutoFillSeries.DEFAULT_SERIES);

}

function UntitledMacro() {

  // Sort Profit by highest first
  var spreadsheet = SpreadsheetApp.getActive();
  spreadsheet.getRange('H:H').activate();
  spreadsheet.getActiveSheet().sort(8, false);
  
}

function myFunction() {
  var spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = spreadsheet.getActiveSheet();

  // Move the first row to the end
  var lastRow = sheet.getLastRow() // last row with data
  spreadsheet.getRange('2:2').activate();
  spreadsheet.getActiveSheet().moveRows(spreadsheet.getRange('2:2'), lastRow + 1);
}


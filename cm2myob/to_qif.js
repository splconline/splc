/*

To use: highlight a column of QIF entries in Google Sheets. Then run this function
(put it in a menu to make it easier), it will save a file 'today.qif' containing
these entries, in a qif-files folder in GoogleDrive, with the !Type:Bank
header plonked on the top

*/

function to_qif() {

// var ui = SpreadsheetApp.getUi();
// var the_date = ui.prompt("Please enter the date as DD/MM/YYYY");  
// var the_amount = ui.prompt("Please enter the day's total")

var selection = SpreadsheetApp.getActiveSpreadsheet().getSelection();
var activeRange = selection.getActiveRange();

// var activeRange = sheet.getDataRange();

var data = activeRange.getValues();

var csvdata = "!Type:Bank\r\n";

for (var row = 0; row < data.length; row++) {
    csvdata += data[row][0] + "\r\n";
}

/* D T P ^

csvdata += "D" + the_date.getResponseText() + "\r\n";
csvdata += "T" + the_amount.getResponseText() + "\r\n";
csvdata += "PClear to Cheque A/C" + "\r\n";
csvdata += "^";

*/

console.log(csvdata);

// var folder = DriveApp.createFolder("qif-files");
// var file = folder.createFile("today.qif", csvdata);

var file = DriveApp.createFile("today.qif", csvdata);

}

/*

This one is way better, just highlight, run this function, and the QIF file is
generated, complete with the summarising transfer to Cheque A/C transaction
tacked on.

*/ 

function to_qif2() {

var selection = SpreadsheetApp.getActiveSpreadsheet().getSelection();
var activeRange = selection.getActiveRange();
var data = activeRange.getValues();

var tzone = Session.getScriptTimeZone()
var csvdata = "!Type:Bank\r\n";

// Write the individual transactions
for (var row = 0; row < data.length; row++) {
    csvdata += "D" + Utilities.formatDate(data[row][2], tzone , "dd/MM/yyyy") + "\r\n" +
               "T" + data[row][3] + "\r\n" +
               "P" + data[row][0] + " " + data[row][10] + "\r\n" +
               "^" + "\r\n";
}

// Write the summary total as negative
csvdata += "D" + Utilities.formatDate(data[row-1][2], tzone , "dd/MM/yyyy") + "\r\n" +
           "T-" + data[row-1][4] + "\r\n" +
           "PClear to Cheque A/C\r\n" +
           "^" + "\r\n";


var filename = Utilities.formatDate(data[row-1][2], tzone , "dd-MM-yyyy") + ".qif"
var file = DriveApp.createFile(filename, csvdata);

SpreadsheetApp.getUi().alert("QIF file " + filename + " saved");

}
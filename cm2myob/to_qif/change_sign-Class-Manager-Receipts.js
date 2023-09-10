// change sign function used to add a (-) before a positive number and a (+) before a negative number.
  function changeSign(number) {
    if (number >= 0) {
      return -number;
    } else {
     return Math.abs(number);
    }
  }

// Write the summary total as negative
csvdata += "D" + Utilities.formatDate(data[row-1][2], tzone , "dd/MM/yyyy") + "\r\n" +
           "T" + changeSign(data[row-1][4]) + "\r\n" +
           "PClear to Cheque A/C\r\n" +
           "^" + "\r\n";
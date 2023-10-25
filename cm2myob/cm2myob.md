## Transferring a Day's ClassManager Transactions to MYOB

1. Use the monthly spreadsheet ([sample](https://docs.google.com/spreadsheets/d/1UDaqFh49KcJt-YtewiFfOAGJYN6JTZZoq208b1h0r-0/edit?usp=sharing)) to calculate the day's constituent ClassManager transactions (see [this video](https://www.youtube.com/watch?v=JuN0Co573HI) on how to do this).

2. Check the balance of the MYOB 1-1550 ClassManager Clearing Account, make sure it is zero before you start.

3. Using a spreadsheet formula (example below), construct a bank statement QIF file made of the day's transactions, adding an extra credit (negative) transaction of the day's total into the QIF list (this added transaction must be dated the date of the day'stransactions in question, it will be reconciled in step 6). If you are unfamiliar with QIF files, [read this QIF format specification](https://en.wikipedia.org/wiki/Quicken_Interchange_Format#Data_format).

4. Import this QIF file as a 'bank statement' into the ClassManager Clearing Account.

5. Manually allocate each 'bank statement' transaction as appropriate, except the extra negative transaction added in step 3. Leave this extra negative transaction unallocated, it will be reconciled/allocated in the next step 6.

6. Transfer the total day's amount from the ClassManager Clearing Account to the Cheque Account. Then, go to 'Banking' for the Cheque Account, filtering for unallocated transactions. There will be an 'Possible match' link next to the transfer. Click this link and allocate it to this transfer transaction. Repeat for the ClassManager Clearing Account.

7. Important: check that the ClassManager Clearing Account balance is zero, so you are ready for the next day's transactions.

---

Sample spreadsheet formula to construct a QIF file transaction:

```
=concatenate("D",TEXT(C29,"dd/mm/yyyy"),char(10),"T",D29,char(10),"P",A29," ",K29,char(10),"^")
```

Assuming we're in row 29, the date is in column C, amount in column D, receipt number in column A, narration in column K.
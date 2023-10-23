SELECT "Date",SUM(TaxCollected), substr("Date",7,4) || "-" || substr("Date",4,2) || "-" || substr("Date",1,2) AS ISODate
FROM GSTCollGSTReport
GROUP BY "Date"
ORDER BY DATE(ISODate)
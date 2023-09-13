SELECT Given, Surname, SUM(Paid) AS total_amount
FROM receipts
GROUP BY Given, Surname
ORDER BY total_amount DESC;
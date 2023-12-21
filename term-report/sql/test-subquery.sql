SELECT
    Facilitator, SUM(Income) AS TotalIncome, SUM(Fee) AS TotalFee, SUM(Profit) AS TotalProfit,
	Sum(TotStus) AS TotalStudents, Count(Facilitator) AS NumberCourses, AVG(Profit) AS AvgProfit
FROM
    'profit-facilitator'
GROUP BY
    Facilitator
ORDER BY AvgProfit DESC


SELECT
 	SUM(CAST(replace(substr(course_income.TotalIncome,2),",","") AS FLOAT)) -
  	SUM(CAST(replace(substr(course_income.OperatingFee,2),",","") AS FLOAT)) AS Profit,
	course_history.Facilitator
FROM
    course_income INNER JOIN course_history
    ON course_income.Code = course_history.Code
    AND course_income.FirstSession = course_history.Session || " " || course_history.Time
/*
   Use this WHERE clause to either :
   1. Extract specific course categories AC, HW, L, SC
   2. Filter out classes from the previous term that 'leak' into the curent term
*/

WHERE
-- for : AC, HW, L, SC, SB
--    substr(course_income.Code,1,1)  =  "L" AND
--    date(ISODate) > date('2023-09-01')

GROUP BY course_history.Facilitator

ORDER BY Profit DESC

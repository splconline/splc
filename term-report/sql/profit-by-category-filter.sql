WITH 'profit' AS (
SELECT
    CASE
	    WHEN substr(course_history.Code,2,1) GLOB '[A-Z]' THEN substr(course_history.Code,1,2)
		ELSE substr(course_history.Code,1,1)
    END AS CodeCat, course_income.Code, course_income.Course, course_income.'Tot-Stus',
    CAST(replace(substr(course_income.TotalIncome,2),",","") AS FLOAT) AS Income,
    CAST(replace(substr(course_income.OperatingFee,2),",","") AS FLOAT) AS Fee,
 	CAST(replace(substr(course_income.TotalIncome,2),",","") AS FLOAT) -
  	CAST(replace(substr(course_income.OperatingFee,2),",","") AS FLOAT) AS Profit,
-- Below is to get date as ISO so that we can do filtering later on	
	CASE length(substr(course_income.FirstSession, 1, instr(course_income.FirstSession,' ')))
        WHEN 11 THEN
	        substr(course_income.FirstSession,7,4) || '-' ||
	        CASE substr(course_income.FirstSession,3,3)
                WHEN 'Jan' THEN '01'
                WHEN 'Feb' THEN '02'
                WHEN 'Mar' THEN '03'
                WHEN 'Apr' THEN '04'
                WHEN 'May' THEN '05'
                WHEN 'Jun' THEN '06'
                WHEN 'Jul' THEN '07'
                WHEN 'Aug' THEN '08'
                WHEN 'Sep' THEN '09'
                WHEN 'Oct' THEN '10'
                WHEN 'Nov' THEN '11'
                WHEN 'Dec' THEN '12'
            END || '-0' || substr(course_income.FirstSession,1,1)
	    ELSE
		    substr(course_income.FirstSession,8,4) || '-' ||
	        CASE substr(course_income.FirstSession,4,3)
                WHEN 'Jan' THEN '01'
                WHEN 'Feb' THEN '02'
                WHEN 'Mar' THEN '03'
                WHEN 'Apr' THEN '04'
                WHEN 'May' THEN '05'
                WHEN 'Jun' THEN '06'
                WHEN 'Jul' THEN '07'
                WHEN 'Aug' THEN '08'
                WHEN 'Sep' THEN '09'
                WHEN 'Oct' THEN '10'
                WHEN 'Nov' THEN '11'
                WHEN 'Dec' THEN '12'
			END	|| '-' || substr(course_income.FirstSession,1,2)
	END AS ISODate, course_history.Facilitator
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
    date(ISODate) > date('2023-01-01')
ORDER BY Profit DESC
)

SELECT
    CodeCat, SUM(Income) AS TotalIncome, SUM(Fee) AS TotalFee, SUM(Profit) AS TotalProfit,
	SUM('Tot-Stus') AS TotalStudents, Count(Facilitator) AS NumberCourses, AVG(Profit) AS AvgProfit
FROM
    'profit'
GROUP BY
    CodeCat
ORDER BY CodeCat


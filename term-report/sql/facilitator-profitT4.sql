SELECT
    CASE
	    WHEN substr(course_historyT4.Code,2,1) GLOB '[A-Z]' THEN substr(course_historyT4.Code,1,2)
		ELSE substr(course_historyT4.Code,1,1)
    END AS CodeCat, course_incomeT4.Code, course_incomeT4.Course, course_incomeT4.TotStus,
    CAST(replace(substr(course_incomeT4.TotalIncome,2),",","") AS FLOAT) AS Income,
    CAST(replace(substr(course_incomeT4.OperatingFee,2),",","") AS FLOAT) AS Fee,
 	CAST(replace(substr(course_incomeT4.TotalIncome,2),",","") AS FLOAT) -
  	CAST(replace(substr(course_incomeT4.OperatingFee,2),",","") AS FLOAT) AS Profit,
	CASE length(substr(course_incomeT4.FirstSession, 1, instr(course_incomeT4.FirstSession,' ')))
        WHEN 11 THEN
	        substr(course_incomeT4.FirstSession,7,4) || '-' ||
	        CASE substr(course_incomeT4.FirstSession,3,3)
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
            END || '-0' || substr(course_incomeT4.FirstSession,1,1)
	    ELSE
		    substr(course_incomeT4.FirstSession,8,4) || '-' ||
	        CASE substr(course_incomeT4.FirstSession,4,3)
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
			END	|| '-' || substr(course_incomeT4.FirstSession,1,2)
	END AS ISODate, course_historyT4.Facilitator
FROM
    course_incomeT4 INNER JOIN course_historyT4
    ON course_incomeT4.Code = course_historyT4.Code
    AND course_incomeT4.FirstSession = course_historyT4.Session || " " || course_historyT4.Time
--WHERE
-- for T4: AC, HW, L, SC, SB
--    substr(course_incomeT4.Code,1,1)  =  "L" AND
--    date(ISODate) > date('2023-09-01')
ORDER BY Profit DESC

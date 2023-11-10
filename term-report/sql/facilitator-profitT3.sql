SELECT
    CASE
	    WHEN substr(course_historyT3.Code,2,1) GLOB '[A-Z]' THEN substr(course_historyT3.Code,1,2)
		ELSE substr(course_historyT3.Code,1,1)
    END AS CodeCat, course_incomeT3.Code, course_incomeT3.Course, course_incomeT3.TotStus,
    CAST(replace(substr(course_incomeT3.TotalIncome,2),",","") AS FLOAT) AS Income,
    CAST(replace(substr(course_incomeT3.OperatingFee,2),",","") AS FLOAT) AS Fee,
 	CAST(replace(substr(course_incomeT3.TotalIncome,2),",","") AS FLOAT) -
  	CAST(replace(substr(course_incomeT3.OperatingFee,2),",","") AS FLOAT) AS Profit,
	CASE length(substr(course_incomeT3.FirstSession, 1, instr(course_incomeT3.FirstSession,' ')))
        WHEN 11 THEN
	        substr(course_incomeT3.FirstSession,7,4) || '-' ||
	        CASE substr(course_incomeT3.FirstSession,3,3)
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
            END || '-0' || substr(course_incomeT3.FirstSession,1,1)
	    ELSE
		    substr(course_incomeT3.FirstSession,8,4) || '-' ||
	        CASE substr(course_incomeT3.FirstSession,4,3)
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
			END	|| '-' || substr(course_incomeT3.FirstSession,1,2)
	END AS ISODate, course_historyT3.Facilitator
FROM
    course_incomeT3 INNER JOIN course_historyT3
    ON course_incomeT3.Code = course_historyT3.Code
    AND course_incomeT3.FirstSession = course_historyT3.Session || " " || course_historyT3.Time
WHERE
-- for T3: AC, HW, L, SC, SB
--    substr(course_incomeT3.Code,1,1)="L" AND
    date(ISODate) > date('2023-07-01')
ORDER BY Profit DESC

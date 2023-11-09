SELECT Code, Course, TotStus,
    CAST(replace(substr(TotalIncome,2),",","") AS FLOAT) AS Income,
    CAST(replace(substr(OperatingFee,2),",","") AS FLOAT) AS Fee,
 	CAST(replace(substr(TotalIncome,2),",","") AS FLOAT) -
  	CAST(replace(substr(OperatingFee,2),",","") AS FLOAT) AS Profit,
	CASE length(substr(FirstSession, 1, instr(FirstSession,' ')))
        WHEN 11 THEN
	        substr(FirstSession,7,4) || '-' ||
	        CASE substr(FirstSession,3,3)
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
            END || '-0' || substr(FirstSession,1,1)
	    ELSE
		    substr(FirstSession,8,4) || '-' ||
	        CASE substr(FirstSession,4,3)
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
			END	|| '-' || substr(FirstSession,1,2)
	END AS ISODate
FROM
    course_incomeT3
WHERE
-- for T4: AC, HW, L, SC, SB
    substr(Code,1,1)="L" AND
    date(ISODate) > date('2023-07-01')
ORDER BY Profit

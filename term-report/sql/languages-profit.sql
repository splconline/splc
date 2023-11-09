SELECT Course,Code, TotStus, FirstSession,
    CAST(replace(substr(TotalIncome,2),",","") AS FLOAT) AS Income,
    CAST(replace(substr(OperatingFee,2),",","") AS FLOAT) AS Fee,
 	CAST(replace(substr(TotalIncome,2),",","") AS FLOAT) -
  	CAST(replace(substr(OperatingFee,2),",","") AS FLOAT) AS Profit,
	substr(FirstSession, 1, instr(FirstSession,' ')) AS TheDate,
--	CASE length(substr(FirstSession, 1, instr(FirstSession,' ')))
--	    WHEN 10 THEN '0' || substr(FirstSession, 1, instr(FirstSession,' '))
--		ELSE substr(FirstSession, 1, instr(FirstSession,' ')) AS ThePadDate
--    END
	substr(substr(FirstSession, 1, instr(FirstSession,' ')), 8, 4) || '-' || 
            CASE substr(substr(FirstSession, 1, instr(FirstSession,' ')), 4, 3)
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
            END || '-' || substr(substr(FirstSession, 1, instr(FirstSession,' ')), 1, 2) AS ISODate
	
FROM
    course_incomeT4
WHERE
    substr(Code,1,1)="L"
ORDER BY Profit

-- Shows classes about to die (under quota) in date order

SELECT Name, Code, Facilitator, Sessionz,

CASE length(Sessionz)
 WHEN 11 THEN
     substr(Sessionz,8,4) || '-' ||
	        CASE substr(Sessionz,4,3)
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
            END || '-' || substr(Sessionz,1,2)
			   ELSE
   substr(Sessionz,7,4) || '-' ||
       CASE substr(Sessionz,3,3)
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
          END || '-0' || substr(Sessionz,1,1)
END AS ISODate,

 Students, MinQuota
FROM course_history
WHERE  Students < MinQuota AND ISODate > '2024-06-30'
ORDER BY ISODate
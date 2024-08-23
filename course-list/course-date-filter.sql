SELECT
Name, Code, Facilitator,Session,
	CASE length(Session)
        WHEN 10 THEN
	        substr(Session,7,4) || '-' ||
	        CASE substr(Session,3,3)
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
            END || '-0' || substr(Session,1,1)
	    ELSE
		    substr(Session,8,4) || '-' ||
	        CASE substr(Session,4,3)
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
			END	|| '-' || substr(Session,1,2)
	END AS ISODate
FROM
course_historyT3
WHERE
ISODate >= "2024-07-15"
ORDER BY Facilitator, ISODate
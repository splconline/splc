/*
Extracts the course category code for the course code (e.g. L from L4, AC from AC26)

*/
SELECT
    Code,
    CASE
	    WHEN substr(Code,2,1) GLOB '[A-Z]' THEN substr(Code,1,2)
		ELSE substr(Code,1,1)
	END
FROM
    test

-- Son of a bitch what happened
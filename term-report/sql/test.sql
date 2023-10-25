SELECT
    Code,
    CASE
	    WHEN substr(Code,2,1) GLOB '[A-Z]' THEN substr(Code,1,2)
		ELSE substr(Code,1,1)
	END
FROM
    test

/*

Extracts the category code (e.g. AC, SC, L etc) from the course code
(e.g. AC25, SC22, L5), then calculates profit per category.

*/
 
SELECT
    CASE
	    WHEN substr(Code,2,1) GLOB '[A-Z]' THEN substr(Code,1,2)
		ELSE substr(Code,1,1)
	END AS CodeCat,
	SUM(CAST(replace(substr(TotalIncome,2,length(TotalIncome)),",","") AS FLOAT)) AS Income,
    SUM(CAST(replace(substr(OperatingFee,2,length(OperatingFee)),",","") AS FLOAT)) AS OpFee,
  	SUM(CAST(replace(substr(TotalIncome,2,length(TotalIncome)),",","") AS FLOAT)) - 
  	SUM(CAST(replace(substr(OperatingFee,2,length(OperatingFee)),",","") AS FLOAT)) AS Profit
FROM course_incomeT4
    GROUP BY CodeCat

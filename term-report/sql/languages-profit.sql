SELECT Course,Code,
    CAST(replace(substr(TotalIncome,2,length(TotalIncome)),",","") AS FLOAT) AS Income,
    CAST(replace(substr(OperatingFee,2,length(OperatingFee)),",","") AS FLOAT) AS Fee,
	CAST(replace(substr(TotalIncome,2,length(TotalIncome)),",","") AS FLOAT) -
	CAST(replace(substr(OperatingFee,2,length(OperatingFee)),",","") AS FLOAT) AS Profit
FROM
    course_incomeT3
WHERE
    substr(Code,1,1)="L"
ORDER BY Profit

-- Son of a bitch what happened
SELECT Pers_num, Mem_Num, Given, Surname, substr(Mem_Num,1,4)|| '-' || substr(Mem_Num,5,2) || '-' || '01' AS TheDate
FROM people
WHERE Mem_Num IS NOT NULL AND TheDate BETWEEN '2022-07-01' AND '2023-06-30'

ORDER BY Pers_num

SELECT Pers_num,Mem_Num,Given,Surname,
	   DATE(substr(Mem_Num,1,4) || '-' || substr(Mem_Num,5,2)|| '-' || '01') AS TheDate
FROM members
WHERE
-- Comment and edit the line below as required
    TheDate BETWEEN '2023-01-01' AND '2023-06-30'
--  TheDate < '2022-07-01'
ORDER BY TheDate
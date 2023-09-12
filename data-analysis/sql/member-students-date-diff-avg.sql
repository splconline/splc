SELECT AVG(JULIANDAY('2023-07-01') - JULIANDAY(DATE(substr(members.Mem_Num,1,4) || '-' || substr(members.Mem_Num,5,2)|| '-' || '01'))) 
                 AS TheAverage
FROM members INNER JOIN students
ON members.Pers_num  = students.Pers_num

SELECT *
FROM members LEFT JOIN students
ON members.Pers_num = students.Pers_num
WHERE students.Pers_num IS NULL

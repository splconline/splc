SELECT *
FROM students LEFT JOIN members
ON members.Pers_num = students.Pers_num
WHERE members.Pers_num IS NULL
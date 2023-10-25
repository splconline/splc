SELECT *
FROM members
INNER JOIN students
ON members.Pers_num = students.Pers_num

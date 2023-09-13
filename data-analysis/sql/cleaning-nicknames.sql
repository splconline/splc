SELECT Given,Surname,
       CASE WHEN INSTR(Given,"(") = 0
	       THEN Given
	       ELSE SUBSTR(Given,1,INSTR(Given,"(")-1)
	   END AS cleanGiven
FROM students
WHERE INSTR(Given,"(") <> 0
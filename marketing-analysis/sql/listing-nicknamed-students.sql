SELECT Given,Surname,instr(Given,"(") AS thePosition
FROM students
-- WHERE thePosition <> 0
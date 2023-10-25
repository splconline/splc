SELECT receipts.Given AS TheName, receipts.Surname AS TheSurname,
       SUM(receipts.Paid) AS total_amount
FROM members INNER JOIN receipts
ON receipts.Surname = members.Surname
   AND receipts.Given = CASE WHEN INSTR(members.Given,"(") = 0
	                      THEN members.Given
	                      ELSE SUBSTR(members.Given,1,INSTR(members.Given,"(")-1)
	                    END
GROUP BY TheName, TheSurname
ORDER BY total_amount DESC;

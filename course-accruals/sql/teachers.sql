SELECT
  course_income.Code, course_income.Course, 
	substr(course_history.Facilitator,1,instr(course_history.Facilitator,' ')-1) AS 'Teacher', 
	course_history.Session, course_history.Weeks, course_history.Students,
	course_income.OperatingFee
FROM
  course_income INNER JOIN course_history
  ON course_income.Code = course_history.Code
  AND course_income.FirstSession = course_history.Session || " " || course_history.Time
ORDER BY
  CASE
	  WHEN substr(course_history.Code,2,1) GLOB '[A-Z]' THEN substr(course_history.Code,1,2)
	ELSE substr(course_history.Code,1,1)
  END,
	course_history.Facilitator


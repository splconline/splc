SELECT
    course_income.Code, course_income.FirstSession, course_income.Course, course_history.Facilitator
FROM
    course_income INNER JOIN course_history
    ON course_income.Code = course_history.Code
    AND course_income.FirstSession = course_history.Session || " " || course_history.Time


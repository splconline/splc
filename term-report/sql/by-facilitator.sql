SELECT
    course_incomeT4.Code, course_incomeT4.FirstSession, course_incomeT4.Course, course_historyT4.Facilitator
FROM
    course_incomeT4 INNER JOIN course_historyT4
    ON course_incomeT4.Code = course_historyT4.Code
    AND course_incomeT4.FirstSession = course_historyT4.Session || " " || course_historyT4.Time


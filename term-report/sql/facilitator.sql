SELECT
    course_incomeT4.Code, course_incomeT4.FirstSession, course_incomeT4.Course, course_historyT4.Facilitator
FROM
    course_incomeT4 INNER JOIN course_historyT4
    ON course_incomeT4.Code = course_historyT4.Code

--      AND course_incomeT4.Date = course_historyT4.Date
--      (but we need to convert the dates to datetime)
--      https://www.internotes.net/sqlite-dates
--      course_incomeT4: FirstSession 16-Oct-2023 10:30am
--      course_historyT4: Session 20-Oct-2023 Time 10:30am
--      So course_incomeT4.FirstSession = course_historyT4.Session || " " || course_historyT4.Time
--      should work

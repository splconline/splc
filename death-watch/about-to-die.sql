-- Name, Code, Facilitator, Session, Students, MinQuota

SELECT Name, Code, Facilitator, "Session", Students, MinQuota
FROM course_history
WHERE Students < MinQuota
ORDER BY "Session"

/*
   From two lists of students, finds the outer join e.g. students
   who attended x but didn't attend y.

   Example below shows list of students who registered this year but
   didn't register last year (which is why their Given Name in last
   year's list is null).
*/

SELECT
    thisyear.Given,thisyear.Surname,thisyear.Email
FROM
    thisyear LEFT OUTER JOIN lastyear
    ON thisyear.Given = lastyear.Given AND thisyear.Surname = lastyear.Surname
WHERE lastyear.Given IS NULL

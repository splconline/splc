/*
   From a list of students, from multiple .csv files concatenated into a single
   .csv file, lists the unique students grouped by email address
*/

SELECT
    Given, Surname, Email, COUNT(Email)
FROM
    allstudents
WHERE
    Given <> 'Given'
GROUP BY Email

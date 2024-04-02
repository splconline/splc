/* 
   Extracts Verena's students who were not Tania's students.
   Done using CTE because need to extract unique students from
   .csv concatenated from all ClassManager exported student lists
*/

WITH verenaUnq AS (
    SELECT
        Given, Surname, Email, COUNT(Email)
    FROM
        verena
    WHERE
        Given <> 'Given'
    GROUP BY Email
    ),
    taniaT12024Unq AS (
    SELECT
        Given, Surname, Email, COUNT(Email)
    FROM
        taniaT12024
    WHERE
        Given <> 'Given'
    GROUP BY Email
    )

SELECT
    verenaUnq.Given,verenaUnq.Surname,verenaUnq.Email
FROM
    verenaUnq LEFT OUTER JOIN taniaT12024Unq
    ON verenaUnq.Given = taniaT12024Unq.Given AND verenaUnq.Surname = taniaT12024Unq.Surname
WHERE taniaT12024Unq.Given IS NULL

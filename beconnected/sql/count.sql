/* Don't forget to chage the name of the database to 'onedbdata'
   So that it works */

SELECT
    FirstName, LastName, FirstContactDate,
	substr(FirstContactDate,1,4) || '-' || substr(FirstContactDate,6,2) || '-' || substr(FirstContactDate,9,2) AS ISODate
FROM onedbdata
    WHERE DATE(ISODate) > DATE('2023-10-01')
ORDER BY ISODate

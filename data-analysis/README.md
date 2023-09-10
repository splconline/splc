# SPLC Marketing Analysis

## Objective
To calculate various metrics regarding SPLC membership and enrolment (i.e. student status) at SPLC for a particular financial year. Note:

1. Not all enrolments are by members, as some courses are opened to non-members.
2. Note also that not all members are enrolled. For example some members are life members, while some enrolled in the previous financial year, while their annual membership extended into the financial year being measured

## Source data
There are two tables that are used as source data, the membership table (a list of all members) and enrolment table obtained from [ClassManager](http://classmanager.com.au) exports for a specified period (e.g. a teaching term, or the financial year). These are assembled into an SQL database then queried using the following SQL queries.

*The SQL code below assumes that these tables are assigned variable names `members` and `students`.*

## SQL code & Results

### Members who are students
The core group of students are members, as most of SPLC courses are members only. As a guideline, multiple week courses during the term are members-only, anything else is open to non-members

```
SELECT *
FROM members
INNER JOIN students
ON members.Pers_num = students.Pers_num
```
*FY23 Result: 477*

### Students who are not members
E.g. they attended courses where membership was not required e.g WA Mahjong Tournament, St John Defibrillator Demonstration.

```
SELECT *
FROM students LEFT JOIN members
ON members.Pers_num = students.Pers_num
WHERE members.Pers_num IS NULL
```
*FY2023 Result: 223*

### New & previous members
Members who first joined in the period in question. The code below is to be edited as indicated depending on whether you want to output members who joined before a particular date, or within a date range.

```
SELECT Pers_num,Mem_Num,Given,Surname,
	   DATE(substr(Mem_Num,1,4) || '-' || substr(Mem_Num,5,2)|| '-' || '01') AS TheDate
FROM members
WHERE
-- Comment and edit the line below as required
--  TheDate BETWEEN '2022-07-01' AND '2023-06-30'
	TheDate < '2022-07-01'
ORDER BY TheDate
```
*FY2023 Results: 482 previous members, 139 new members.*


## To Do

1. CUSTOMERS PER YEAR

1.1. Customers (Non-Members, B2C)
Customers (Non-Members), TOTAL: 223
Customers (Non-Members), NEW 
Customers (Non-Members), REPEAT
Customers (Non-Members), Average life time

1.2. Customers (Members, B2C)
Customers (Members), TOTAL: 477
Customers (Members), NEW 
Customers (Members), REPEAT
Customers (Members), Average life time

1.3 Customers (B2B)
Customers ( B2B  ), TOTAL
Customers ( B2B  ), NEW 
Customers ( B2B  ), REPEAT
Customers ( B2B  ), Average life time

1.4 Customers (B2G)
Customers ( B2G  ), TOTAL
Customers ( B2G  ), NEW 
Customers ( B2G  ), REPEAT
Customers ( B2G  ), Average life time

Is Membership only for individuals, or does SPLC also offer corporate membership?

1.5 Revenues/Customer  ($/Year, $/booking)
Customers (Non-Members, B2C)
Customers (Members, B2C)
Customers (B2B)
Customers (B2G); e.g government funded IT programs

1.6 Customer demographics (in percentage per group, if available)
by age groups (eg "20%: 55-75y")
by gender (f/m/other)
by education
by income
by ancestry
by relationship (family members, non related)

1.7 NEW CUSTOMER TOP/FLOPs (day, week, month)
When did MOST NEW customers sign up ? (eg. April, T1 start, Tuesdays mornings?)
When do the LEAST NEW customers sign up ? (Term break, Sundays,)

# SPLC Marketing Analysis

## Objective
To calculate various metrics regarding SPLC membership and enrolment (i.e. student status) at SPLC for a particular financial year. Note:

1. Not all enrolments are by members, as some courses are opened to non-members.
2. Note also that not all members are enrolled. For example some members are life members, while some enrolled in the previous financial year, while their annual membership extended into the financial year being measured

## Source data
There are two tables that are used as souce data, the membership table (a list of all members) and enrolment table obtained from [ClassManager](http://classmanager.com.au) exports. For our purposes we import them into an SQL database as the table names `members` and `students`.

## SQL code

### Students who are not members
E.g. they attended courses where membership was not required e.g WA Mahjong Tournament, St John Defibrillator Demonstration.

```
SELECT *
FROM students LEFT JOIN members
ON members.Pers_num = students.Pers_num
WHERE members.Pers_num IS NULL
```

### Members who are students
The core group of students are members, as most of SPLC courses are members only. As a guideline, multiple week courses during the term are members-only, anything else is open to non-members

```
SELECT *
FROM members
INNER JOIN students
ON members.Pers_num = students.Pers_num
```

### Members who are not students
As mentioned before, these are people who are life members, or whose memberships are on the cusps of the year.

```
SELECT *
FROM members LEFT JOIN students
ON members.Pers_num = students.Pers_num
WHERE students.Pers_num IS NULL
```

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

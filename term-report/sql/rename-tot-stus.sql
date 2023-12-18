-- SQL tries to evaluate the ClassManager variable name 'Tot-Stus', so before we run any queries, rename to 'TotStus'   

ALTER TABLE course_income
RENAME COLUMN "Tot-Stus" TO TotStus;

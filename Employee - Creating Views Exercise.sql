/*
*  Create a view "90-95" that:
*  Shows me all the employees, hired between 1990 and 1995
*  Database: Employees
*/

CREATE OR REPLACE VIEW "90-95" AS
SELECT *
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) BETWEEN 1990 AND 1995;

/*
*  Create a view "bigbucks" that:
*  Shows me all employees that have ever had a salary over 80000
*  Database: Employees
*/

CREATE OR REPLACE VIEW "bigbucks" AS
SELECT DISTINCT e.emp_no, e.first_name, e.last_name
FROM employees AS e
JOIN salaries AS s USING(emp_no)
WHERE s.salary > 80000


SELECT *
FROM bigbucks

/*
* DB: Employees
* Table: employees
* Question: Show me for each employee which department they work in
*/

SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name) AS "name", c.dept_name 
FROM "public"."employees" AS a
INNER JOIN "public"."dept_emp" AS b ON a.emp_no = b.emp_no
INNER JOIN "public"."departments" AS c ON b.dept_no = c.dept_no
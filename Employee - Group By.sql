/*
*  How many people were hired on any given hire date?
*  Database: Employees
*  Table: Employees
*/

SELECT e.hire_date, count(e.emp_no) AS "total hired emp"
FROM employees AS e
GROUP BY  e.hire_date
ORDER BY "total hired emp" DESC;

/*
*   Show me all the employees, hired after 1991 and count the amount of positions they've had
*  Database: Employees
*/

SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, count(emp_no) AS "Total Positions"
FROM employees AS e
JOIN titles AS t USING(emp_no)
WHERE EXTRACT(YEAR FROM e.hire_date) > 1991
GROUP BY e.emp_no
ORDER BY e.emp_no;


/*
*  Show me all the employees that work in the department development and the from and to date.
*  Database: Employees
*/

SELECT e.emp_no, de.from_date, de.to_date, d.dept_name
FROM employees AS e
JOIN dept_emp AS de USING(emp_no)
JOIN departments AS d USING(dept_no)
WHERE dept_name ILIKE 'development';

-- using group by

SELECT e.emp_no, de.from_date, de.to_date
FROM employees AS e
JOIN dept_emp AS de USING(emp_no)
WHERE dept_no ILIKE 'd005'
GROUP BY e.emp_no, de.from_date, de.to_date
ORDER BY e.emp_no, de.to_date  
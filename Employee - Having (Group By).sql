
/*
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/
SELECT e.emp_no, count(e.emp_no) AS "Total Titles"
FROM employees AS e 
JOIN titles AS t USING (emp_no)
GROUP BY e.emp_no
HAVING count(e.emp_no) > 2
ORDER BY "Total Titles" DESC;


/*
*  Show me all the employees that have had more than 15 salary changes that work in the department development
*  Database: Employees
*/
SELECT e.emp_no, count(s.salary) AS "salary changes"
FROM employees AS e
JOIN salaries AS s USING(emp_no)
JOIN dept_emp as de USING(emp_no)
WHERE dept_no like 'd005'
GROUP BY e.emp_no
HAVING count(s.salary) > 15
ORDER BY "salary changes" DESC;

/*
*  Show me all the employees that have worked for multiple departments
*  Database: Employees
*/

SELECT e.emp_no, count(de.dept_no) AS "total dept worked"
FROM employees AS e
JOIN dept_emp AS de USING (emp_no)
GROUP BY e.emp_no
HAVING count(de.dept_no) > 1;
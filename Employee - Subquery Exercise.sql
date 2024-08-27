/*
* DB: Employees
* Table: employees
* Question: Filter employees who have emp_no 110183 as a manager
*/

SELECT e.emp_no, e.first_name, e.last_name
FROM employees AS e
JOIN  dept_emp AS de USING(emp_no)
JOIN dept_manager AS dm USING(dept_no)
WHERE dm.emp_no = 110183
ORDER BY e.emp_no;


SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_emp
    WHERE dept_no = (
        SELECT dept_no 
        FROM dept_manager
        WHERE emp_no = 110183
    )
)
ORDER BY emp_no;
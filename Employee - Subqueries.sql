/* Show all employees older than the average age */
SELECT first_name, last_name, age(birth_date)
FROM employees
WHERE age(birth_date) > (SELECT avg(age(birth_date)) FROM employees);


-- Show the title by salary for each employee
SELECT emp_no, salary, from_date, (SELECT title FROM titles AS t 
                                  --referencing from outside - correlated subquery
                                  WHERE t.emp_no = s.emp_no  AND (t.from_date = s.from_date OR t.from_date = s.from_date + INTERVAL '2 days'))
FROM salaries AS s
ORDER BY emp_no;

-- but instead of this we can use left outer join, and we get the same result
-- and this is much neater and readable
-- we need to know when to use subquery


SELECT s.emp_no, salary, from_date, t.title
FROM salaries AS s
LEFT OUTER JOIN titles AS t USING(emp_no, from_date)
ORDER BY s.emp_no

-- we can also use JOIN to see when they get their titles
--INNER JOIN
--FIND the SALARY of an Employee,but only the ones that led to a new title And also their starting salary together with their title.
--clue title change always follow 2 days after the Raise

SELECT a.emp_no, concat(a.first_name, ' ', a.last_name) AS "name", b.salary, COALESCE(c.title, 'No change') AS "title", COALESCE(c.from_date::TEXT, '-') AS "title_taken"
FROM "public"."employees" AS a
INNER JOIN "public"."salaries" AS b ON a.emp_no = b.emp_no
INNER JOIN "public"."titles" AS c ON a.emp_no = c.emp_no
AND (b.from_date = c.from_date OR c.from_date = (b.from_date + INTERVAL '2 days' ))
ORDER BY a.emp_no

--LEFT OUTER JOIN
-- you want to know how many employees arent manager
SELECT count(emp.emp_no)
FROM employees AS emp
LEFT JOIN dept_manager AS dep ON emp.emp_no = dep.emp_no
WHERE dep.emp_no IS NULL;
--because all the not nulls are managers because they will get matched on emp_no in dept_manager table.

--you want to know every salary raise and also know which ones where a promotion
SELECT a.emp_no, concat(a.first_name, ' ', a.last_name) AS "name", b.salary, COALESCE(c.title, 'No change') AS "title", COALESCE(c.from_date::TEXT, '-') AS "title_taken"
FROM "public"."employees" AS a
INNER JOIN "public"."salaries" AS b ON a.emp_no = b.emp_no
LEFT JOIN "public"."titles" AS c ON a.emp_no = c.emp_no
AND (b.from_date = c.from_date OR c.from_date = (b.from_date + INTERVAL '2 days' ))
ORDER BY a.emp_no;
-- create view last_salary_change as
-- SELECT e.emp_no, max(s.from_date)
-- from salaries as s
-- join employees as e using(emp_no)
-- join dept_emp as de using(emp_no)
-- join departments as d using(dept_no)
-- 
-- group by e.emp_no
-- order by e.emp_no

-- select emp_no, e.first_name, e.last_name, s.salary as "latest salary", s.from_date as "latest date", s.to_date  from salaries as s
-- join "public"."last_salary_change" as l using(emp_no)
-- join employees as e using(emp_no)
-- where from_date = max


SELECT s.emp_no, d.dept_name, s.from_date AS "latest date", s.salary AS "latest salary"
FROM "public"."last_salary_change" AS l
JOIN salaries AS s USING(emp_no)
JOIN dept_emp AS de USING(emp_no)
JOIN departments AS d USING(dept_no)

WHERE max = s.from_date
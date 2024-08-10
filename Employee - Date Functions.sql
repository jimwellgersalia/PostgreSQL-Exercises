/*
* DB: Employees
* Table: employees
* Question: Get me all the employees above 60, use the appropriate date functions
*/

SELECT emp_no, first_name, last_name,EXTRACT(YEAR FROM AGE(birth_date)) AS "age"  FROM public.employees
WHERE  EXTRACT(YEAR FROM AGE(birth_date)) > 60;

/*
* DB: Employees
* Table: employees
* Question: How many employees where hired in February?
*/

SELECT count(emp_no) FROM employees
WHERE EXTRACT(MONTH FROM hire_date) = 2;

/*
* DB: Employees
* Table: employees
* Question: How many employees were born in november?
*/

SELECT count(birth_date) FROM employees
WHERE EXTRACT(MONTH FROM birth_date)= 11;

/*
* DB: Employees
* Table: employees
* Question: Who is the oldest employee? (Use the analytical function MAX)
*/

SELECT max(age(birth_date)) AS "oldest employee" FROM employees;
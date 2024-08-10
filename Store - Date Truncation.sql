/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/

SELECT * FROM orders
WHERE DATE_TRUNC('month', orderdate) = date '2004-01-01'
--same as between and and
--where orderdate between '20040101' and '20040131'
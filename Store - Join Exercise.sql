
/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/

SELECT o.orderid, o.orderdate, o.customerid, o.totalamount, c.state
FROM "public"."orders" AS o
INNER JOIN "public"."customers" AS c ON o.customerid = c.customerid
WHERE c.state IN ('OH','NY', 'OR')
ORDER BY o.orderid;

/*
* DB: Store
* Table: products
* Question: Show me the inventory for each product
*/
SELECT p.prod_id, p.title, p.actor, i.quan_in_stock
FROM "public"."products" AS p
INNER JOIN "public"."inventory" AS i ON p.prod_id = i.prod_id;

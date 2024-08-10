-- using SUM in window function

SELECT orderid, customerid, netamount,
       sum(netamount) OVER(
           PARTITION BY customerid
           ORDER BY orderid
       )
FROM orders
ORDER BY customerid;

-- using row_number in window function
-- row_number ignores  the framing.

SELECT prod_id, price, category,
       row_number() OVER(
       PARTITION BY category
       ORDER BY price
       )
FROM products
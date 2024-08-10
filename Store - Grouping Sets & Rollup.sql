-- you need to alias the column name when using grouping sets
SELECT ol.prod_id AS "prod_id", sum(ol.quantity)
FROM orderlines AS ol
GROUP BY
    GROUPING SETS(
        (),
        (prod_id),
        (orderlineid)
    );
    
    
-- Roll up uses, find all possible combination and display it  
SELECT EXTRACT(YEAR FROM orderdate) AS  "year",
       EXTRACT(MONTH FROM orderdate) AS  "month",
       EXTRACT(DAY FROM orderdate) AS  "day",
       sum(ol.quantity)
FROM orderlines AS ol
GROUP BY
    ROLLUP(
       EXTRACT(YEAR FROM orderdate),
       EXTRACT(MONTH FROM orderdate),
       EXTRACT(DAY FROM orderdate)
    )
ORDER BY
    EXTRACT(YEAR FROM orderdate),
    EXTRACT(MONTH FROM orderdate),
    EXTRACT(DAY FROM orderdate)
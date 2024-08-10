SELECT prod_id, price, category, 
--        first_value(price) over(
--             PARTITION by category
--             order by price 
--             range between unbounded PRECEDING and unbounded following
--        ) as "cheapest in category"
-- or just use min and partition by category to see the lowest on every category
min(price) OVER(PARTITION BY category) AS "cheapest in category"
FROM products
-- SELECT count(firstname) as "Total Customer"
-- FROM "public"."customers"
-- WHERE gender = 'F' and (state = 'NY' or state = 'OR')

-- SELECT count(age)
-- from "public"."customers"
-- where not age = 55 and not age = 20

-- How many female customers do we have from the state of Oregon (OR)?
-- SELECT count(firstname)
-- from "public"."customers"
-- where gender = 'F' AND state = 'OR';


-- Who over the age of 44 has an income of 100 000 or more?
-- SELECT firstname, lastname
-- from "public"."customers"
-- where age > 44 and income >= 100000

--Who between the ages of 30 and 50 has an income of less than 50 000?
-- select firstname, lastname
-- from "public"."customers"
-- where (age>=30 AND age<=50) and income<50000

-- What is the average income between the ages of 20 and 50?
SELECT avg(income)
FROM "public"."customers"
WHERE age = 20 OR age = 50

/*
* DB: Store
* Table: customers
* Question: How many people's zipcode have a 2 in it?.
* Expected output: 4211 
*/
SELECT count(zip) AS "Total" FROM public.customers
WHERE zip::TEXT LIKE '%2%'
/*
* DB: Store
* Table: customers
* Question: How many people's zipcode start with 2 with the 3rd character being a 1.
* Expected output: 109 
*/
SELECT count(zip) AS "Total" FROM public.customers
WHERE zip::TEXT LIKE '2_1%'


/*
* DB: Store
* Table: customers
* Question: Which states have phone numbers starting with 302?
* Replace null values with "No State"                                                  
* Expected output: https://imgur.com/AVe6G4c
*/
SELECT COALESCE(state, 'No State') FROM public.customers
WHERE phone LIKE '302%'
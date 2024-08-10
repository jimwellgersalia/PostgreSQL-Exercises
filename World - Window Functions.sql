/*
*  Show the population per continent
*  Database: World
*  Table: Country
*/

SELECT DISTINCT continent AS "continent", sum(population) OVER w1 AS "total population"
FROM country
WINDOW w1 AS (PARTITION BY continent);
/*
*  To the previous query add on the ability to calculate the percentage of the world population
*  What that means is that you will divide the population of that continent by the total population and multiply by 100 to get a percentage.
*  Make sure you convert the population numbers to float using `population::float` otherwise you may see zero pop up
*  Try to use CONCAT AND ROUND to make the data look pretty
*
*  Database: World
*  Table: Country
*/

SELECT DISTINCT continent AS "continent",
               sum(population) OVER w1 AS "total population",
               concat(round((sum(population::float4) OVER w1 / sum(population::float4) OVER()) * 100), ' %') AS "percentage"
FROM country
WINDOW w1 AS (PARTITION BY continent)

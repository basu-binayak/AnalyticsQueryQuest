-- QUERY 1 - select all fields from the customers table 
SELECT * FROM customers;

-- Query 2 : select multiple fields from the customers table 
SELECT customer_id, first_name, last_name 
FROM customers;

-- Query 3 : use aliasing to rename columns 
SELECT first_name , email as customer_email
FROM customers;

-- Query 4 : filtering - select the first and last name of the customers who come from Washington city. Also create a column full_name which CONCATENATES the first_name and the last_name
SELECT first_name, last_name, first_name || ' ' || last_name as full_name 
FROM customers
WHERE city = 'Washington';

-- making complex conditionals with AND/OR/BETWEEN 
-- Query 5 : select the models that were built between 2013 and 2017 (both inclusive) and the  manufacturer's suggested Retail Price is less than 100 
SELECT model, base_msrp, year
FROM products
WHERE (year BETWEEN 2013 AND 2017) AND (base_msrp < 1000);

-- Query 6 : select models that were released in the year 2014 or had a product type of automobile.
SELECT model, product_type
FROM products
WHERE year=2014
OR product_type='automobile';

-- IN/NOT IN clause 
-- Query 7 : select those models from the years 2014, 2016,or 2019
SELECT model, product_type, year
FROM products 
WHERE year IN (2014, 2016, 2019);

-- Query 8: if we want to return models not from the years 2014, 2016, or 2019 - use NOT IN
SELECT model, product_type, year
FROM products 
WHERE year NOT IN (2014, 2016, 2019);

-- ORDER BY clause
-- Query 9: Return all the models of production type 'sooter' ordered by the production_end_date (new production should be at the top)
SELECT model, production_end_date as production_date
FROM products 
WHERE product_type = 'scooter'
ORDER BY production_end_date DESC;

-- Query 10: order all the rows in the table first by the year of the model from newest to oldest, and then by the MSRP from least to greatest.
SELECT *
FROM products
ORDER BY year DESC, base_msrp ASC;

-- LIMIT Clause
-- Query 11 : select models from products ordered by production_start_date but limit the number of data points to 5
SELECT model
FROM products
ORDER BY production_start_date
LIMIT 5;

-- IS NULL/ IS NOT NULL clause 
-- Query 12: The column city in customers table has null values - we want the customer_id where the city is null
SELECT customer_id, city
FROM customers 
WHERE city IS NULL;
-- Query 13 : if we want to exclude null use IS NOT NULL
SELECT customer_id , city
FROM customers
WHERE city IS NOT NULL;

-- all in one 
-- Query 14: return top 10 rows all field of the salespeople table where dealership_id is 17 and order by hire_date
SELECT *
FROM salespeople
WHERE dealership_id = 17
ORDER BY hire_date
LIMIT 10;

-- Query 15 : find all the salespeople that were hired in 2021 and 2022 but have not been terminated,  that is, the hire_date must be later than 2021-01-01,and termination_date is null, ordered by hire date, with the latest first
SELECT *
FROM salespeople
WHERE hire_date BETWEEN '2021-01-01' AND '2022-12-31'
AND termination_date IS NULL 
ORDER BY hire_date DESC; 

-- Query 16 : find a salesperson that was hired in 2021 and whose first name starts with Nic.
/*
Percentage (%): Represents zero or more characters.

LIKE 'Nic%' — Matches any string starting with "Nic" (e.g., "Nic", "Nicole", "Nick", "Nicolas").
LIKE '%son' — Matches any string ending with "son" (e.g., "Jackson", "Thomson", "Wilson").
LIKE '%a%' — Matches any string that contains the letter "a" anywhere (e.g., "Maria", "Patrick", "Sarah").

Underscore (_): Represents a single character.

LIKE 'N_c' — Matches any three-letter word starting with "N" and ending with "c" (e.g., "Nic", "Nac", "Nec").
LIKE '_ick' — Matches any four-letter word ending with "ick" (e.g., "Nick", "Rick", "Mick").
*/
SELECT *
FROM salespeople
WHERE first_name LIKE 'Nic%'
AND hire_date >= '2021-01-01'
AND hire_date <= '2021-12-31';

-- select distinct records
-- Query 17 - find all the distinct names of the cities in the customers table
SELECT DISTINCT city
FROM customers;
-- Query 18 - find all the distinct (city, state) combination in the customers table 
SELECT DISTINCT city, state
FROM customers;
-- NOTE: DISTINCT includes [Null] as a distinct category

-- OFFSET is used to skip a number of rows before returning the result, often in pagination scenarios.
-- Query 19 : find the second top city from the top_cities_data based on the number of customers 

SELECT *
FROM top_cities_data
ORDER BY number_of_customers DESC
LIMIT 1 OFFSET 1;

--- Query 20 : Find the number of invalid emails of the customers 
SELECT 
  count(*) AS invalid_email_count
FROM 
  customers
WHERE 
  email !~ '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';













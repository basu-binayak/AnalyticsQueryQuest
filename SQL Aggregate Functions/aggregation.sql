-- Let us first look at some of the most used aggragte functions in sql

-- Query 1: Use the COUNT() aggregate function to count the number of customers in California(CA) and also note that we can do mathematical operations on the aggregate functions 
SELECT COUNT(*) as total_ca_customers, count(*)/2 as halved_ca_customers
FROM customers
WHERE state = 'CA';

-- Query 2: The COUNT() function returns the count of a row without null values 
SELECT 
	COUNT(customer_id) as total_row_count , 
	COUNT(state) as non_null_states ,
	COUNT(customer_id) - COUNT(state) as null_states
FROM customers;

-- Query 3: All aggregate functions, most oftenly used!

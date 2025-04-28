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
SELECT 
    AVG(base_msrp) AS avg_base_msrp,
    SUM(base_msrp) AS sum_base_msrp,
    SUM(base_msrp) / COUNT(*) AS calc_avg_base_msrp,
    MIN(base_msrp) AS min_base_msrp,
    MAX(base_msrp) AS max_base_msrp,
    STDDEV(base_msrp) AS std_dev_base_msrp,
    COUNT(base_msrp) AS count_base_msrp,
    VARIANCE(base_msrp) AS variance_base_msrp,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY base_msrp) AS median_base_msrp
FROM products;

-- Query 4 : COUNT DISTINCT is used to calculate the number of distinct values in a column 
SELECT 
    COUNT(customer_id)::numeric / COUNT(DISTINCT state) AS avg_customers_per_state
FROM 
    customers; 

/* Note that in the preceding SQL, the count of customer ID is cast as numeric. The reason you must cast this as numeric is that the COUNT() function always returns an integer. PostgreSQL treats integer division differently than float division in that it will ignore the decimal part of the result.*/

-- Query 4.1 - Writing the same query but using the CAST function
SELECT 
    CAST(COUNT(customer_id) AS float) / COUNT(DISTINCT state) AS avg_customers_per_state
FROM 
    customers;

--Query 5 - Using GROUP BY clause to get the customer count for each of the non-null states. 
SELECT state, count(*) as customer_count
FROM customers 
WHERE state is NOT NULL 
GROUP BY state
ORDER BY customer_count DESC;

-- Query 6 - We modify the lst query and add a filter to the aggregation that we have done using the HAVING clause
SELECT state, count(*) as customer_count
FROM customers 
WHERE state is NOT NULL 
GROUP BY state
HAVING count(*)>1000 -- note that the aggregation function is used since HAVING is evaluated before the SELECT clause 
ORDER BY customer_count DESC; -- ORDER BY is evaluated after the SELECT statement , hence the alias for the aggregate function can be used. 

-- Query 7 - Using a function of a column as a key to the GROUP BY clause 
SELECT 
	TO_CHAR(date_added, 'YYYY') AS Year, --using a function of a column as a key to the GROUP BY clause 
	COUNT(*)
FROM customers
GROUP BY TO_CHAR(date_added, 'YYYY')
ORDER BY Year;

-- Query 8 - GROUP BY using Multiple columns - i.e. there are two keys for the GROUP BY clause i.e. the aggrgation takes place based on the unique combination of the two columns selected as the key
SELECT 
	state, 
	TO_CHAR(date_added, 'YYYY') AS Year,
	count(*) as customer_count
FROM customers 
WHERE state is NOT NULL 
GROUP BY 
	state,
	TO_CHAR(date_added, 'YYYY')
ORDER BY 
	customer_count DESC;


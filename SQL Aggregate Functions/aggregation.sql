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


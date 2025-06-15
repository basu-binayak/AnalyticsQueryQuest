-- Drop the table if it already exists
DROP TABLE IF EXISTS sample_conditions;

-- 1️⃣ Create table
CREATE TABLE sample_conditions (
    id SERIAL PRIMARY KEY,
    value1 INTEGER,
    value2 INTEGER
);

-- 2️⃣ Insert sample data
INSERT INTO sample_conditions (value1, value2) VALUES
(NULL, 100),
(50, NULL),
(NULL, NULL),
(30, 30),
(25, 50),
(0, 0);

-- 3️⃣ Conditional Function Queries

-- 🔹 COALESCE: First non-null value between value1 and value2
SELECT id, value1, value2,
       COALESCE(value1, value2) AS first_non_null
FROM sample_conditions;

-- 🔹 NULLIF: Returns NULL if value1 = value2
SELECT id, value1, value2,
       NULLIF(value1, value2) AS null_if_equal
FROM sample_conditions;

-- 🔹 CASE WHEN: Categorize based on conditions
SELECT id, value1, value2,
       CASE
           WHEN value1 IS NULL AND value2 IS NULL THEN 'Both NULL'
           WHEN value1 IS NULL THEN 'value1 is NULL'
           WHEN value2 IS NULL THEN 'value2 is NULL'
           WHEN value1 = value2 THEN 'Equal values'
           ELSE 'Different values'
       END AS condition_category
FROM sample_conditions;

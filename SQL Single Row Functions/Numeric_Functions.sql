-- Drop the table if it exists
DROP TABLE IF EXISTS sample_numbers;

-- 1️⃣ Create table
CREATE TABLE sample_numbers (
    id SERIAL PRIMARY KEY,
    number1 NUMERIC,
    number2 NUMERIC
);

-- 2️⃣ Insert sample data
INSERT INTO sample_numbers (number1, number2) VALUES
(-5, 3),
(1.2, NULL),
(1.8, NULL),
(3.1415, NULL),
(2, 3),
(9, NULL),
(7, 3),
(-42, NULL),
(1, NULL),
(1, NULL);

-- 3️⃣ Numeric Function Queries

-- 🔢 ABS
SELECT id, number1, ABS(number1) AS absolute_value
FROM sample_numbers;

-- 🔼 CEIL / CEILING
SELECT id, number1, CEIL(number1) AS ceiling_value
FROM sample_numbers;

-- 🔽 FLOOR
SELECT id, number1, FLOOR(number1) AS floor_value
FROM sample_numbers;

-- 🎯 ROUND to 2 decimals
SELECT id, number1, ROUND(number1, 2) AS rounded_value
FROM sample_numbers;

-- ✂️ TRUNCATE to 2 decimals
SELECT id, number1, TRUNC(number1, 2) AS truncated_value
FROM sample_numbers;

-- ⏫ POWER (number1 ^ number2)
SELECT id, number1, number2, POWER(number1, number2) AS power_result
FROM sample_numbers
WHERE number2 IS NOT NULL;

-- 📐 SQRT
SELECT id, number1, SQRT(number1) AS square_root
FROM sample_numbers
WHERE number1 >= 0;

-- 🔁 MODULUS
SELECT id, number1, number2, MOD(number1, number2) AS mod_result
FROM sample_numbers
WHERE number2 IS NOT NULL;

-- ➕ SIGN
SELECT id, number1, SIGN(number1) AS sign_value
FROM sample_numbers;

-- 🔣 NATURAL LOG
SELECT id, number1, LN(number1) AS natural_log
FROM sample_numbers
WHERE number1 > 0;

-- 📈 EXPONENTIAL
SELECT id, number1, EXP(number1) AS exponential_result
FROM sample_numbers;

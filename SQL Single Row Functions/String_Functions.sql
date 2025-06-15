-- Drop table if it already exists
DROP TABLE IF EXISTS sample_texts;

-- 1️⃣ Create table
CREATE TABLE sample_texts (
    id SERIAL PRIMARY KEY,
    text_value TEXT
);

-- 2️⃣ Insert sample data
INSERT INTO sample_texts (text_value) VALUES
('hello'),
('SQL'),
('hello world'),
('abcdef'),
('   hello   '),
('7'),
('abc'),
('a'),
('b'),
('abcdef');

-- 3️⃣ String Function Queries

-- 🔢 LENGTH
SELECT id, text_value, LENGTH(text_value) AS length_of_text
FROM sample_texts;

-- 🔡 LOWER
SELECT id, text_value, LOWER(text_value) AS lower_text
FROM sample_texts;

-- 🔠 UPPER
SELECT id, text_value, UPPER(text_value) AS upper_text
FROM sample_texts;

-- 🅰️ INITCAP
SELECT id, text_value, INITCAP(text_value) AS initcap_text
FROM sample_texts;

-- ✂️ SUBSTRING
SELECT id, text_value, SUBSTRING(text_value FROM 2 FOR 3) AS substring_example
FROM sample_texts;

-- ✨ TRIM
SELECT id, text_value, TRIM(text_value) AS trimmed_text
FROM sample_texts;

-- ⬅️ LPAD
SELECT id, text_value, LPAD(text_value, 3, '0') AS left_padded
FROM sample_texts
WHERE text_value = '7';

-- ➡️ RPAD
SELECT id, text_value, RPAD(text_value, 3, '0') AS right_padded
FROM sample_texts
WHERE text_value = '7';

-- 🔁 REPLACE
SELECT id, text_value, REPLACE(text_value, 'a', 'z') AS replaced_text
FROM sample_texts;

-- 🔗 CONCAT
SELECT id, text_value, CONCAT(text_value, '_suffix') AS concatenated_text
FROM sample_texts;

-- 🔍 POSITION
SELECT id, text_value, POSITION('b' IN text_value) AS position_b
FROM sample_texts;

-- 🧩 OVERLAY
SELECT id, text_value, OVERLAY(text_value PLACING 'zz' FROM 3) AS overlayed_text
FROM sample_texts;

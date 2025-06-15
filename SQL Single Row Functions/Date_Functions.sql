-- Drop table if it already exists
DROP TABLE IF EXISTS sample_dates;

-- 1️⃣ Create table
CREATE TABLE sample_dates (
    id SERIAL PRIMARY KEY,
    label TEXT,
    sample_ts TIMESTAMP
);

-- 2️⃣ Insert sample data
INSERT INTO sample_dates (label, sample_ts) VALUES
('Millennium Start', '2000-01-01 00:00:00'),
('Y2K Bug Day', '2000-01-02 08:30:00'),
('My Birthday', '1995-07-15 14:20:00'),
('Today Midnight', CURRENT_DATE),
('Current Time', CURRENT_TIMESTAMP),
('Another Day', '2022-06-18 23:59:59');

-- 3️⃣ Date/Time Function Queries

-- 📅 CURRENT_DATE
SELECT CURRENT_DATE AS today;

-- 🕒 CURRENT_TIME
SELECT CURRENT_TIME AS now_time;

-- 🕓 CURRENT_TIMESTAMP
SELECT CURRENT_TIMESTAMP AS current_datetime;

-- ⏳ AGE()
SELECT id, label, sample_ts, AGE(sample_ts) AS age_from_now
FROM sample_dates;

-- 🔍 EXTRACT() - year, month, day
SELECT id, label,
       EXTRACT(YEAR FROM sample_ts) AS year_extracted,
       EXTRACT(MONTH FROM sample_ts) AS month_extracted,
       EXTRACT(DAY FROM sample_ts) AS day_extracted
FROM sample_dates;

-- 🔍 DATE_PART() - hour, minute
SELECT id, label,
       DATE_PART('hour', sample_ts) AS hour_part,
       DATE_PART('minute', sample_ts) AS minute_part
FROM sample_dates;

-- 🔧 DATE_TRUNC() - truncate to month
SELECT id, label,
       DATE_TRUNC('month', sample_ts) AS month_start
FROM sample_dates;

-- 🪄 TO_CHAR() - format timestamp
SELECT id, label,
       TO_CHAR(sample_ts, 'YYYY-MM-DD') AS formatted_date,
       TO_CHAR(sample_ts, 'HH24:MI:SS') AS formatted_time
FROM sample_dates;

-- 🔁 TO_DATE() - convert string to date
SELECT TO_DATE('2025-04-28', 'YYYY-MM-DD') AS parsed_date;

# 📌 What are Single Row Functions?
- They take **one input row** and **return exactly one output value** for each row.
- They **do not** collapse multiple rows into one (that's what **aggregates** do).

---

# 🔥 PostgreSQL Single Row Functions (Organized)

---
---

## 1. **String Functions**
| Function | Purpose | Example |
|:---|:---|:---|
| `LENGTH(str)` | Length of string | `LENGTH('hello') → 5` |
| `LOWER(str)` | Lowercase | `LOWER('SQL') → 'sql'` |
| `UPPER(str)` | Uppercase | `UPPER('sql') → 'SQL'` |
| `INITCAP(str)` | First letter capitalized | `INITCAP('hello world') → 'Hello World'` |
| `SUBSTRING(str FROM pattern)` | Extract part of a string | `SUBSTRING('abcdef' FROM 2 FOR 3) → 'bcd'` |
| `TRIM(str)` | Remove leading/trailing spaces | `TRIM(' hello ') → 'hello'` |
| `LPAD(str, len, padstr)` | Left pad | `LPAD('7', 3, '0') → '007'` |
| `RPAD(str, len, padstr)` | Right pad | `RPAD('7', 3, '0') → '700'` |
| `REPLACE(str, from, to)` | Replace substring | `REPLACE('abc','a','z') → 'zbc'` |
| `CONCAT(str1, str2,...)` | Concatenate | `CONCAT('a','b') → 'ab'` |
| `POSITION(sub IN str)` | Position of substring | `POSITION('b' IN 'abc') → 2` |
| `OVERLAY(str PLACING newstr FROM start)` | Replace part of string | `OVERLAY('abcdef' PLACING 'zz' FROM 3) → 'abzzef'` |

We'll start by assuming the `sample_texts` table with this data:

| id | text\_value |
| -- | ----------- |
| 1  | hello       |
| 2  | SQL         |
| 3  | hello world |
| 4  | abcdef      |
| 5  | hello       |
| 6  | 7           |
| 7  | abc         |
| 8  | a           |
| 9  | b           |
| 10 | abcdef      |

---

### 1. 🧮 `LENGTH()`

```sql
SELECT id, text_value, LENGTH(text_value) AS length_of_text FROM sample_texts;
```

💡 **Explanation**:
Returns the **number of characters** in the string.

🧾 **Result**:

| id | text\_value | length\_of\_text |
| -- | ----------- | ---------------- |
| 1  | hello       | 5                |
| 2  | SQL         | 3                |
| 3  | hello world | 11               |
| 4  | abcdef      | 6                |
| 5  | hello       | 9                |
| 6  | 7           | 1                |
| 7  | abc         | 3                |
| 8  | a           | 1                |
| 9  | b           | 1                |
| 10 | abcdef      | 6                |

---

### 2. 🔡 `LOWER()`

```sql
SELECT id, text_value, LOWER(text_value) AS lower_text FROM sample_texts;
```

💡 **Explanation**:
Converts all characters to **lowercase**.

🧾 **Result**:

| id | text\_value | lower\_text |
| -- | ----------- | ----------- |
| 1  | hello       | hello       |
| 2  | SQL         | sql         |
| 3  | hello world | hello world |
| 4  | abcdef      | abcdef      |
| 5  | hello       | hello       |
| 6  | 7           | 7           |

---

### 3. 🔠 `UPPER()`

```sql
SELECT id, text_value, UPPER(text_value) AS upper_text FROM sample_texts;
```

💡 **Explanation**:
Converts all characters to **uppercase**.

🧾 **Result**:

| id | text\_value | upper\_text |
| -- | ----------- | ----------- |
| 1  | hello       | HELLO       |
| 2  | SQL         | SQL         |
| 3  | hello world | HELLO WORLD |

---

### 4. 🅰️ `INITCAP()`

```sql
SELECT id, text_value, INITCAP(text_value) AS initcap_text FROM sample_texts;
```

💡 **Explanation**:
Capitalizes the **first letter** of each word, lowers others.

🧾 **Result**:

| id | text\_value | initcap\_text |
| -- | ----------- | ------------- |
| 3  | hello world | Hello World   |
| 4  | abcdef      | Abcdef        |

---

### 5. ✂️ `SUBSTRING()`

```sql
SELECT id, text_value, SUBSTRING(text_value FROM 2 FOR 3) AS substring_example FROM sample_texts;
```

💡 **Explanation**:
Extracts **3 characters starting from position 2** (1-based index).

🧾 **Result**:

| text\_value | substring\_example |
| ----------- | ------------------ |
| hello       | ell                |
| SQL         | QL                 |
| abcdef      | bcd                |

---

### 6. ✨ `TRIM()`

```sql
SELECT id, text_value, TRIM(text_value) AS trimmed_text FROM sample_texts;
```

💡 **Explanation**:
Removes **leading and trailing spaces**.

🧾 **Result**:

| text\_value | trimmed\_text |
| ----------- | ------------- |
| '  hello  ' | 'hello'       |

---

### 7. ⬅️ `LPAD()` — Pad Left

```sql
SELECT id, text_value, LPAD(text_value, 3, '0') AS left_padded
FROM sample_texts
WHERE text_value = '7';
```

💡 **Explanation**:
Pads the string from **left with '0'** to make it 3 characters.

🧾 **Result**:

| text\_value | left\_padded |
| ----------- | ------------ |
| 7           | 007          |

---

### 8. ➡️ `RPAD()` — Pad Right

```sql
SELECT id, text_value, RPAD(text_value, 3, '0') AS right_padded
FROM sample_texts
WHERE text_value = '7';
```

💡 **Explanation**:
Pads the string from **right with '0'** to make it 3 characters.

🧾 **Result**:

| text\_value | right\_padded |
| ----------- | ------------- |
| 7           | 700           |

---

### 9. 🔁 `REPLACE()`

```sql
SELECT id, text_value, REPLACE(text_value, 'a', 'z') AS replaced_text FROM sample_texts;
```

💡 **Explanation**:
Replaces **every 'a' with 'z'** in the string.

🧾 **Result**:

| text\_value | replaced\_text |
| ----------- | -------------- |
| abcdef      | zbcdef         |
| a           | z              |

---

### 10. 🔗 `CONCAT()`

```sql
SELECT id, text_value, CONCAT(text_value, '_suffix') AS concatenated_text FROM sample_texts;
```

💡 **Explanation**:
Appends `_suffix` to each string.

🧾 **Result**:

| text\_value | concatenated\_text |
| ----------- | ------------------ |
| hello       | hello\_suffix      |
| abc         | abc\_suffix        |

---

### 11. 🔍 `POSITION()`

```sql
SELECT id, text_value, POSITION('b' IN text_value) AS position_b FROM sample_texts;
```

💡 **Explanation**:
Returns the **1-based index** of `'b'` in the string (0 if not found).

🧾 **Result**:

| text\_value | position\_b |
| ----------- | ----------- |
| abcdef      | 2           |
| abc         | 2           |
| b           | 1           |
| hello       | 0           |

---

### 12. 🧩 `OVERLAY()`

```sql
SELECT id, text_value, OVERLAY(text_value PLACING 'zz' FROM 3) AS overlayed_text FROM sample_texts;
```

💡 **Explanation**:
**Replaces characters** starting from position 3 with `'zz'`.

🧾 **Result**:

| text\_value | overlayed\_text |
| ----------- | --------------- |
| hello       | hezzlo          |
| abcdef      | abzzef          |
| abc         | abzz            |
| SQL         | SQzz            |

---
---

## 2. **Numeric Functions**
| Function | Purpose | Example |
|:---|:---|:---|
| `ABS(x)` | Absolute value | `ABS(-5) → 5` |
| `CEIL(x)` or `CEILING(x)` | Round up | `CEIL(1.2) → 2` |
| `FLOOR(x)` | Round down | `FLOOR(1.8) → 1` |
| `ROUND(x, d)` | Round to `d` decimals | `ROUND(3.1415, 2) → 3.14` |
| `TRUNC(x, d)` | Truncate to `d` decimals | `TRUNC(3.1415, 2) → 3.14` |
| `POWER(x, y)` | `x` to the power `y` | `POWER(2, 3) → 8` |
| `SQRT(x)` | Square root | `SQRT(9) → 3` |
| `MOD(x, y)` | Modulus (remainder) | `MOD(7, 3) → 1` |
| `SIGN(x)` | Sign (-1, 0, 1) | `SIGN(-42) → -1` |
| `LN(x)` | Natural log | `LN(1) → 0` |
| `EXP(x)` | e^x | `EXP(1) → 2.718...` |

---
### 3. **Date/Time Functions**
| Function | Purpose | Example |
|:---|:---|:---|
| `CURRENT_DATE` | Current date | |
| `CURRENT_TIME` | Current time | |
| `CURRENT_TIMESTAMP` | Current date and time | |
| `AGE(timestamp)` | Age difference from now | `AGE('2000-01-01') → 24 years...` |
| `EXTRACT(field FROM timestamp)` | Extract parts | `EXTRACT(YEAR FROM CURRENT_DATE)` |
| `DATE_PART(field, source)` | Same as EXTRACT | `DATE_PART('month', CURRENT_DATE)` |
| `DATE_TRUNC('unit', timestamp)` | Truncate to precision | `DATE_TRUNC('month', NOW())` |
| `TO_CHAR(timestamp, format)` | Format datetime as string | `TO_CHAR(NOW(), 'YYYY-MM-DD')` |
| `TO_DATE(str, format)` | Parse date string to date | `TO_DATE('2025-04-28', 'YYYY-MM-DD')` |

---
### 4. **Conditional Functions**
| Function | Purpose | Example |
|:---|:---|:---|
| `COALESCE(x1, x2, ..., xn)` | First non-NULL value | `COALESCE(NULL, 2, 3) → 2` |
| `NULLIF(x, y)` | NULL if x=y | `NULLIF(5,5) → NULL` |
| `CASE WHEN ... THEN ... ELSE ... END` | If-else logic | See below |

✅ Example CASE:

```sql
SELECT CASE WHEN score >= 60 THEN 'Pass' ELSE 'Fail' END
FROM students;
```

---
### 5. **Type Conversion Functions**
| Function | Purpose | Example |
|:---|:---|:---|
| `CAST(expr AS type)` | Convert datatype | `CAST('123' AS INTEGER)` |
| `::` Operator | Shortcut for CAST | `'123'::INTEGER` |
| `TO_NUMBER(text, format)` | Parse numbers | `TO_NUMBER('12,345.67', '99G999D99')` |
| `TO_CHAR(number, format)` | Format number as text | `TO_CHAR(1234.56, 'FM$9,999.00')` |

---
### 6. **Regex Functions (Text Matching/Manipulation)**
| Function | Purpose | Example |
|:---|:---|:---|
| `REGEXP_MATCHES(str, pattern)` | Find matches | |
| `REGEXP_REPLACE(str, pattern, replace)` | Replace matches | |
| `REGEXP_SPLIT_TO_ARRAY(str, pattern)` | Split to array | |
| `REGEXP_SPLIT_TO_TABLE(str, pattern)` | Split to rows | |
| `str ~ 'pattern'` | Regex match (boolean) | |
| `str !~ 'pattern'` | Regex NOT match (boolean) | |

---

# 🚀 Important:
- These functions are **evaluated row-by-row**.
- You can **combine** multiple functions together!  
  Example:

```sql
SELECT UPPER(TRIM(name)) FROM users;
```

- You can **use them in**:
  - `SELECT`
  - `WHERE`
  - `ORDER BY`
  - `UPDATE SET`
  - `CASE` expressions

---

# ✨ Bonus Tip:
If you want to **list ALL available functions dynamically** from your PostgreSQL system:
```sql
SELECT proname
FROM pg_proc
WHERE prokind = 'f';  -- 'f' = function
```

(⚡ It will return thousands, so better to filter.)

---
---

# 📌 What are Multiple Row Functions in SQL?

* Also called **aggregate functions**.
* They take **multiple rows as input** and return **a single summarized value**.
* They **collapse many rows into one** output value.
* Commonly used with **GROUP BY**, **HAVING**, or over **entire tables**.
* Cannot be used in `WHERE` clause (use `HAVING` instead for filtering aggregated results).

---

# 🔥 PostgreSQL Multiple Row (Aggregate) Functions (Organized)

---

### 1. **Basic Aggregate Functions**

| Function        | Purpose               | Example          |
| :-------------- | :-------------------- | :--------------- |
| `COUNT(*)`      | Count all rows        | `COUNT(*) → 100` |
| `COUNT(column)` | Count non-null values | `COUNT(age)`     |
| `SUM(column)`   | Total of values       | `SUM(salary)`    |
| `AVG(column)`   | Average value         | `AVG(marks)`     |
| `MIN(column)`   | Minimum value         | `MIN(price)`     |
| `MAX(column)`   | Maximum value         | `MAX(price)`     |

---

### 2. **Group-based Aggregation**

| Function   | Purpose                    | Example                                                              |
| :--------- | :------------------------- | :------------------------------------------------------------------- |
| `GROUP BY` | Group rows for aggregation | `SELECT department, AVG(salary) FROM employees GROUP BY department;` |
| `HAVING`   | Filter after grouping      | `HAVING AVG(salary) > 50000`                                         |

✅ Example:

```sql
SELECT department, COUNT(*) 
FROM employees 
GROUP BY department 
HAVING COUNT(*) > 10;
```

---

### 3. **Statistical Functions**

| Function               | Purpose                 | Example                |
| :--------------------- | :---------------------- | :--------------------- |
| `STDDEV(column)`       | Standard deviation      | `STDDEV(score)`        |
| `VARIANCE(column)`     | Variance                | `VARIANCE(score)`      |
| `CORR(x, y)`           | Correlation coefficient | `CORR(height, weight)` |
| `COVAR_POP(x, y)`      | Population covariance   |                        |
| `COVAR_SAMP(x, y)`     | Sample covariance       |                        |
| `REGR_SLOPE(y, x)`     | Regression slope        |                        |
| `REGR_INTERCEPT(y, x)` | Regression intercept    |                        |

---

### 4. **Array and Set Aggregates**

| Function                     | Purpose                           | Example                  |
| :--------------------------- | :-------------------------------- | :----------------------- |
| `ARRAY_AGG(column)`          | Convert group values into array   | `ARRAY_AGG(name)`        |
| `STRING_AGG(str, delimiter)` | Concatenate values with delimiter | `STRING_AGG(name, ', ')` |

✅ Example:

```sql
SELECT department, STRING_AGG(name, ', ')
FROM employees
GROUP BY department;
```

---

### 5. **Boolean Aggregates**

| Function              | Purpose              | Example            |
| :-------------------- | :------------------- | :----------------- |
| `BOOL_AND(condition)` | True if all are true | `BOOL_AND(passed)` |
| `BOOL_OR(condition)`  | True if any is true  | `BOOL_OR(passed)`  |
| `EVERY(condition)`    | Same as `BOOL_AND()` | `EVERY(active)`    |

---

### 6. **Ordered-Set & Percentile Aggregates**

| Function             | Purpose               | Example                                              |
| :------------------- | :-------------------- | :--------------------------------------------------- |
| `PERCENTILE_CONT(p)` | Continuous percentile | `PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY score)` |
| `PERCENTILE_DISC(p)` | Discrete percentile   |                                                      |
| `MODE()`             | Most frequent value   |                                                      |

✅ Example:

```sql
SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY score) 
FROM results;
```

---

### 7. **Custom Aggregates**

* PostgreSQL allows you to create **user-defined aggregate functions**.
* Useful for domain-specific summarization logic.

---

# 🚀 Important Notes:

* These functions are typically used with:

  * `SELECT`
  * `GROUP BY`
  * `HAVING`
  * `WINDOW FUNCTIONS` (with `OVER()` — not covered here, but related)

* They **collapse multiple rows into one result per group** (or entire dataset).

* You **cannot use aggregate functions in WHERE clause** because `WHERE` is evaluated **before** grouping. Use `HAVING` instead.

---

# ✨ Bonus Tip:

To **list all aggregate functions** in PostgreSQL:

```sql
SELECT proname
FROM pg_proc
WHERE prokind = 'a';  -- 'a' = aggregate
```

(⚡ Again, may return hundreds — apply filters as needed.)

---


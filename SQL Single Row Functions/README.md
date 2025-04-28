# 📌 What are Single Row Functions?
- They take **one input row** and **return exactly one output value** for each row.
- They **do not** collapse multiple rows into one (that's what **aggregates** do).

---

# 🔥 PostgreSQL Single Row Functions (Organized)

### 1. **String Functions**
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

---
### 2. **Numeric Functions**
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
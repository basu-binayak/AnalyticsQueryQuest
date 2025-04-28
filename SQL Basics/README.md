# Data Manipulation Language (DML)
This repository covers the basics of **Data Manipulation Language** using the dataset that is available in the book **"SQL for Data Analytics"**(***Chapter 1*** provides a step-by-step guide on how to load the dataset in the postgres database)

## Resource
While **SQL for Data Analytics** is a fantastic resource to deepen your knowledge, the article, mentioned below, offers an additional layer of hands-on insights. Whether you're following along with the book or looking to expand your SQL toolkit, here you'll find practical examples, extra queries, and explanations that take you beyond the pages. Dive in, explore, and power up your SQL skills!

This article , <a href="https://medium.com/@basubinayak05/introduction-to-sql-basics-of-dml-data-manipulation-language-d2213bddf301"> Introduction to SQL: Basics of DML (Data Manipulation Language)</a> dives deep into the use of Data Manipulation Language (DML) in SQL, with a primary focus on the SELECT statement. Here's a structured overview of the key points it covers:

### 1. Basic Syntax of SELECT Statement
- SELECT is used to retrieve specific columns from a table.
```sql
SELECT column1, column2, ... 
FROM table_name;
```
- Example:
```sql
SELECT first_name, last_name, salary 
FROM Employees;
```
- To retrieve all columns, you can use:
```sql
SELECT * 
FROM Employees;
```
### 2. Using Expressions and Calculations
- You can perform operations on columns and display results in new columns without modifying the database.
- Example:
```sql
SELECT id, instructor_name, salary, salary * 1.1 AS new_salary 
FROM instructors;
```
### 3. Using Aliases with AS
- The AS keyword allows you to rename columns or tables for readability.
- Example:
```sql
SELECT 'Data' AS Department 
FROM Employee;
```
### 4. Removing Duplicates with DISTINCT
- DISTINCT eliminates duplicate rows.
- Example:
```sql
SELECT DISTINCT first_name, last_name 
FROM Employees;
```
### 5. Sorting Data with ORDER BY
- The ORDER BY clause allows sorting results in ascending (ASC) or descending (DESC) order.
- Example:
```sql
SELECT * 
FROM Employees 
ORDER BY first_name DESC;
```
- Sorting can also be applied on multiple columns:
```sql
SELECT * 
FROM Employees 
ORDER BY department, salary DESC;
```
### 6. LIMIT and OFFSET
- These clauses are used to limit the number of rows returned and skip certain rows.
- Example:
```sql
SELECT * 
FROM customers 
ORDER BY last_name ASC 
LIMIT 10 OFFSET 10;
```
### 7. Collating Sequences
- SQL uses collating sequences to determine the order of characters when sorting strings (e.g., binary sorting, Unicode sorting).

### 8. Filtering Data with WHERE Clause
- The WHERE clause filters results based on conditions.
- Predicates like =, <>, BETWEEN, IN, LIKE, IS NULL are commonly used.
- Example:
```sql
SELECT first_name, last_name 
FROM teachers 
WHERE school LIKE '%Roos%' 
ORDER BY hire_date DESC;
```
### 9. Pattern Matching with LIKE and ILIKE
- Use LIKE for case-sensitive and ILIKE for case-insensitive pattern matching.
- Wildcards include: 
> - % matches multiple characters.
> - _ matches a single character.

### 10. Logical Operations Table 
Sure! In SQL, especially when dealing with **three-valued logic** (because of `NULL`), the truth tables are a little different compared to just two values (True/False).

Here's a detailed table showing the result of **logical operations** (`AND`, `OR`, `NOT`) when you have `TRUE`, `FALSE`, and `NULL`.


#### 1. Truth Table for `AND`

| A      | B      | A AND B |
|--------|--------|---------|
| TRUE   | TRUE   | TRUE    |
| TRUE   | FALSE  | FALSE   |
| TRUE   | NULL   | NULL    |
| FALSE  | TRUE   | FALSE   |
| FALSE  | FALSE  | FALSE   |
| FALSE  | NULL   | FALSE   |
| NULL   | TRUE   | NULL    |
| NULL   | FALSE  | FALSE   |
| NULL   | NULL   | NULL    |

#### 2. Truth Table for `OR`

| A      | B      | A OR B  |
|--------|--------|---------|
| TRUE   | TRUE   | TRUE    |
| TRUE   | FALSE  | TRUE    |
| TRUE   | NULL   | TRUE    |
| FALSE  | TRUE   | TRUE    |
| FALSE  | FALSE  | FALSE   |
| FALSE  | NULL   | NULL    |
| NULL   | TRUE   | TRUE    |
| NULL   | FALSE  | NULL    |
| NULL   | NULL   | NULL    |


#### 3. Truth Table for `NOT`

| A      | NOT A  |
|--------|--------|
| TRUE   | FALSE  |
| FALSE  | TRUE   |
| NULL   | NULL   |


#### Quick Observations:
- `AND` with `FALSE` always results in `FALSE` (even if the other side is `NULL`).
- `OR` with `TRUE` always results in `TRUE` (even if the other side is `NULL`).
- `NULL` is treated as **"unknown"**, so combining `NULL` with anything else usually results in `NULL` — unless the other operand determines the outcome clearly (`FALSE AND NULL` is `FALSE`, `TRUE OR NULL` is `TRUE`, etc.).
- `NOT NULL` is still `NULL` (because you cannot say for sure whether it's `TRUE` or `FALSE`).

### 11. Precedence of SQL Operators 

#### 🧠 SQL Operator Precedence (Detailed)

| Precedence | Operator(s)                                                                                      | Type                                | Notes                                                |
|:-----------|:-------------------------------------------------------------------------------------------------|:------------------------------------|:-----------------------------------------------------|
| 1 (Highest) | `()`                                                                                            | Parentheses                         | Forces manual precedence.                           |
| 2           | `+`, `-` (Unary plus, minus), `~` (Bitwise NOT)                                                  | Arithmetic/Bitwise                  | Negation and bitwise NOT.                            |
| 3           | `*`, `/`, `%`                                                                                    | Arithmetic                          | Multiplication, division, modulo.                   |
| 4           | `+`, `-` (Binary addition, subtraction)                                                         | Arithmetic                          | Binary addition and subtraction.                    |
| 5           | `=`, `>`, `<`, `>=`, `<=`, `<>`, `!=`                                                            | Comparison                          | Basic comparisons.                                  |
| 6           | `IS NULL`, `IS NOT NULL`, `IS TRUE`, `IS FALSE`, `IS UNKNOWN`, `IS NOT TRUE`, `IS NOT FALSE`, etc. | Comparison/Logical checks           | Null and truth value checking.                      |
| 7           | `BETWEEN`, `NOT BETWEEN`                                                                         | Range checking                      | Inclusive range checking.                           |
| 8           | `IN`, `NOT IN`                                                                                   | Set membership checking             | Checks if value exists in a list/set.                |
| 9           | `LIKE`, `NOT LIKE`, `ILIKE`, `NOT ILIKE`                                                         | Pattern matching                    | Case-sensitive and case-insensitive patterns.       |
| 10          | `SIMILAR TO`, `NOT SIMILAR TO`, `REGEXP_LIKE`, `NOT REGEXP_LIKE`                                  | Pattern matching                    | Regex or similarity matching (depends on SQL flavor).|
| 11          | `NOT`                                                                                            | Logical                             | Negation. (Applies to logical conditions.)           |
| 12          | `AND`                                                                                            | Logical                             | Logical AND.                                         |
| 13 (Lowest) | `OR`                                                                                             | Logical                             | Logical OR.                                          |


#### ✏️ Important Points to Remember

- `IS NULL` and `IS NOT NULL` are **higher precedence** than `AND`/`OR`.
- `BETWEEN` and `IN` come **after comparisons** but **before logical NOT/AND/OR**.
- `NOT` binds **very tightly**: it applies **only to the next immediate condition** unless parentheses are used.
- **Arithmetic** is always evaluated before **logical** operations.
- Parentheses `()` **override** any precedence.


#### 🎯 Quick Example 1

```sql
SELECT 
  CASE
    WHEN salary BETWEEN 40000 AND 60000 OR salary IS NULL THEN 'Eligible'
    ELSE 'Not Eligible'
  END
FROM employees;
```

How SQL evaluates:
- `salary BETWEEN 40000 AND 60000` first
- `salary IS NULL` next
- Then combines using `OR`


#### 🎯 Quick Example 2

```sql
SELECT 
  CASE
    WHEN NOT (status IN ('Active', 'Pending')) THEN 'Inactive'
    ELSE 'Active or Pending'
  END
FROM user_status;
```

How SQL evaluates:
- `status IN ('Active', 'Pending')`
- Then `NOT` applies on the result.

#### ⚡ If You Want It Even Shorter (Memory Trick)

- **Math first** (`+`, `-`, `*`, `/`)
- **Comparison next** (`=`, `>`, `<`, `BETWEEN`, `IN`, `IS NULL`, `LIKE`)
- **NOT** beats **AND**
- **AND** beats **OR**
- **Parentheses** beat everything


### 12. Regular Expressions in SQL

#### ✅ In PostgreSQL, these are valid pattern-matching options:

| Operator/Function | Valid in PostgreSQL? | Notes |
|:------------------|:---------------------|:------|
| `LIKE`, `NOT LIKE` | ✅ | Standard SQL pattern matching (`%`, `_`). |
| `ILIKE`, `NOT ILIKE` | ✅ | Case-insensitive `LIKE`. |
| `SIMILAR TO`, `NOT SIMILAR TO` | ✅ | SQL-style regex matching (simple regex + wildcards). |
| `~` (Regex Match) | ✅ | Regular expression match (case-sensitive). |
| `~*` (Case-insensitive Regex Match) | ✅ | Regular expression match, case-insensitive. |
| `!~` (Regex Not Match) | ✅ | Negative regex match (case-sensitive). |
| `!~*` (Case-insensitive Regex Not Match) | ✅ | Negative regex match, case-insensitive. |
| `REGEXP_MATCHES()` | ✅ | Returns all regex matches (set of text). |
| `REGEXP_REPLACE()` | ✅ | Replaces substring(s) matching regex. |
| `REGEXP_SPLIT_TO_TABLE()`, `REGEXP_SPLIT_TO_ARRAY()` | ✅ | Split strings based on regex. |

#### ❌ `REGEXP_LIKE()` ?
- **`REGEXP_LIKE()` is NOT a native PostgreSQL function.**
- `REGEXP_LIKE()` is available in **Oracle** and **MySQL 8.0+**, but **NOT in PostgreSQL**.
- In PostgreSQL, **use `~` or `~*` instead**.

#### 🧠 Quick Summary:
| To Do This | PostgreSQL Syntax |
|:----------|:-----------------|
| Simple pattern matching | `LIKE`, `NOT LIKE` |
| Case-insensitive simple pattern matching | `ILIKE`, `NOT ILIKE` |
| Basic regex matching | `~ 'pattern'` |
| Case-insensitive regex matching | `~* 'pattern'` |
| Negative regex matching | `!~ 'pattern'` |
| Case-insensitive negative regex matching | `!~* 'pattern'` |
| SQL-style regex matching | `SIMILAR TO` |
| Advanced regex operations (matches, replace, split) | `REGEXP_MATCHES()`, `REGEXP_REPLACE()`, etc. |

#### 🎯 Example 1 — Using `~` (regex)

```sql
SELECT *
FROM employees
WHERE name ~ '^[A-Z][a-z]+$';  -- Name starts with uppercase, followed by lowercase letters
```

#### 🎯 Example 2 — Using `SIMILAR TO`

```sql
SELECT *
FROM employees
WHERE name SIMILAR TO '(John|Johnny|Jonathan)';
```

#### 🎯 Example 3 — Using `ILIKE`

```sql
SELECT *
FROM products
WHERE product_name ILIKE '%chocolate%';
```

#### ⚡ Final Tip:
If you are using PostgreSQL and thinking of `REGEXP_LIKE()`, just **replace it** with `~` or `~*` depending on whether you want case-sensitivity.

### 13. Advanced Regular Expressions in SQL

#### 1. **`REGEXP_MATCHES()` inside a `SELECT`**

✅ Example: **Find rows where the text has an email**.

```sql
SELECT id, content
FROM messages
WHERE REGEXP_MATCHES(content, '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}');
```

👉 **How it works:**  
- `REGEXP_MATCHES()` checks if the text has **any match**.
- If it matches, the row is selected.

#### 2. **`REGEXP_REPLACE()` to Modify Output**

✅ Example: **Mask emails when you SELECT**.

```sql
SELECT id, REGEXP_REPLACE(
  content,
  '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}',
  '[hidden]'
) AS masked_content
FROM messages;
```

👉 **How it works:**  
- It **replaces** all email addresses **in the result** without changing the database.


#### 3. **`REGEXP_REPLACE()` inside an `UPDATE`**

✅ Example: **Permanently update the table** (censor emails).

```sql
UPDATE messages
SET content = REGEXP_REPLACE(
  content,
  '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}',
  '[hidden]',
  'g'
)
WHERE content ~ '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}';
```

👉 **Important things:**
- `SET` uses `REGEXP_REPLACE()` to create the new value.
- `WHERE` uses `~` operator to **filter rows that have emails**.
- `'g'` flag means **replace globally** inside the content (not just first match).

#### 4. **`REGEXP_SPLIT_TO_TABLE()` to create multiple rows**

✅ Example: **Split names separated by semicolon into rows**.

Suppose you have:

```sql
SELECT REGEXP_SPLIT_TO_TABLE('Alice;Bob;Charlie', ';') AS name;
```

You can use this **inside a CTE** (`WITH`) to work with exploded values:

```sql
WITH split_names AS (
    SELECT REGEXP_SPLIT_TO_TABLE(content, ';') AS name
    FROM my_table
)
SELECT name
FROM split_names
WHERE name LIKE 'A%';  -- Get names starting with 'A'
```

#### 5. **Using REGEX with JOINs or Subqueries**

✅ Example:  
Extract hashtags into rows and join with a hashtags table.

```sql
WITH hashtags AS (
    SELECT id, REGEXP_MATCHES(content, '#\w+', 'g') AS tag
    FROM posts
)
SELECT h.id, h.tag
FROM hashtags h
JOIN popular_hashtags p ON h.tag = p.tag;
```

#### ⚡ Quick Mini-Guide
| Situation | What to Use |
|:----------|:------------|
| **Just filter rows** if regex matches | `WHERE column ~ 'regex'` |
| **Extract match values** from rows | `SELECT REGEXP_MATCHES(column, 'regex')` |
| **Replace matches** in output | `SELECT REGEXP_REPLACE(column, 'regex', 'replacement')` |
| **Permanently change DB values** | `UPDATE ... SET column = REGEXP_REPLACE(...)` |
| **Split values into multiple rows** | `SELECT REGEXP_SPLIT_TO_TABLE(column, 'regex')` |


#### 🧠 Important Things to Remember:
- `~` = regex match (boolean, returns true/false)
- `REGEXP_MATCHES()` = returns the **matched strings** (not just true/false)
- `REGEXP_REPLACE()` = replace parts of text matching a pattern
- `REGEXP_SPLIT_TO_TABLE()` = split into multiple **rows**  
- `REGEXP_SPLIT_TO_ARRAY()` = split into an **array** (single row)


#### 🎯 Final Example

**Find all messages that mention a phone number and mask it in results:**

```sql
SELECT id,
       REGEXP_REPLACE(content, '\d{3}-\d{3}-\d{4}', '[phone number]', 'g') AS masked_message
FROM messages
WHERE content ~ '\d{3}-\d{3}-\d{4}';
```

- `\d{3}-\d{3}-\d{4}` matches phone numbers like `123-456-7890`.
- Replace them in results with `[phone number]`.

---

***This article serves as a strong foundation for SQL beginners, covering fundamental query manipulations and operations that are commonly used when dealing with relational databases.***
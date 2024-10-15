# Data Manipulation Language (DML)

This article , <a href="https://medium.com/@basubinayak05/introduction-to-sql-basics-of-dml-data-manipulation-language-d2213bddf301"> Introduction to SQL: Basics of DML (Data Manipulation Language)</a> dives deep into the use of Data Manipulation Language (DML) in SQL, with a primary focus on the SELECT statement. Here's a structured overview of the key points it covers:

## 1. Basic Syntax of SELECT Statement
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
## 2. Using Expressions and Calculations
- You can perform operations on columns and display results in new columns without modifying the database.
- Example:
```sql
SELECT id, instructor_name, salary, salary * 1.1 AS new_salary 
FROM instructors;
```
## 3. Using Aliases with AS
- The AS keyword allows you to rename columns or tables for readability.
- Example:
```sql
SELECT 'Data' AS Department 
FROM Employee;
```
## 4. Removing Duplicates with DISTINCT
- DISTINCT eliminates duplicate rows.
- Example:
```sql
SELECT DISTINCT first_name, last_name 
FROM Employees;
```
## 5. Sorting Data with ORDER BY
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
## 6. LIMIT and OFFSET
- These clauses are used to limit the number of rows returned and skip certain rows.
- Example:
```sql
SELECT * 
FROM customers 
ORDER BY last_name ASC 
LIMIT 10 OFFSET 10;
```
## 7. Collating Sequences
- SQL uses collating sequences to determine the order of characters when sorting strings (e.g., binary sorting, Unicode sorting).
## 8. Filtering Data with WHERE Clause
- The WHERE clause filters results based on conditions.
- Predicates like =, <>, BETWEEN, IN, LIKE, IS NULL are commonly used.
- Example:
```sql
SELECT first_name, last_name 
FROM teachers 
WHERE school LIKE '%Roos%' 
ORDER BY hire_date DESC;
```
## 9. Pattern Matching with LIKE and ILIKE
- Use LIKE for case-sensitive and ILIKE for case-insensitive pattern matching.
- Wildcards include: 
> - % matches multiple characters.
> - _ matches a single character.

***This article serves as a strong foundation for SQL beginners, covering fundamental query manipulations and operations that are commonly used when dealing with relational databases.***
# Aggregate functions

---

### **1. AVG()**
- **Purpose**: Computes the average (mean) of a set of numeric values.
- **Usage**:
  ```sql
  SELECT AVG(column_name) AS average_value FROM table_name;
  ```
- **How It Works**:
  - Sums up all the values in the column.
  - Divides the total by the count of non-NULL values.
- **Example**:
  Given values: `[10, 20, NULL, 30]`
  - Sum = 10 + 20 + 30 = 60
  - Count = 3 (ignores `NULL`)
  - Average = 60 / 3 = **20**


### **2. SUM()**
- **Purpose**: Calculates the total sum of a set of numeric values.
- **Usage**:
  ```sql
  SELECT SUM(column_name) AS total_sum FROM table_name;
  ```
- **How It Works**:
  - Adds up all non-NULL values in the specified column.
- **Example**:
  Given values: `[5, 10, NULL, 20]`
  - Total Sum = 5 + 10 + 20 = **35**


### **3. MIN()**
- **Purpose**: Finds the smallest value in a column.
- **Usage**:
  ```sql
  SELECT MIN(column_name) AS minimum_value FROM table_name;
  ```
- **How It Works**:
  - Ignores `NULL` values.
  - Returns the lowest value in the dataset.
- **Example**:
  Given values: `[50, 20, NULL, 80]`
  - Minimum = **20**


### **4. MAX()**
- **Purpose**: Finds the largest value in a column.
- **Usage**:
  ```sql
  SELECT MAX(column_name) AS maximum_value FROM table_name;
  ```
- **How It Works**:
  - Ignores `NULL` values.
  - Returns the highest value in the dataset.
- **Example**:
  Given values: `[10, 25, NULL, 40]`
  - Maximum = **40**


### **5. STDDEV()**
- **Purpose**: Computes the standard deviation of a set of numeric values.
- **Usage**:
  ```sql
  SELECT STDDEV(column_name) AS std_dev FROM table_name;
  ```
- **How It Works**:

- Measures how much values deviate from the mean.  
  - **Formula**:  
    $\text{Standard Deviation} = \sqrt{\frac{\sum{(x_i - \bar{x})^2}}{N}}$
    
    Where $x_i$ = individual value, $\bar{x}$ = mean, $N$ = total count.  

- **Example**:  
  Values: `[10, 12, 14]`, Mean = 12  
  - Deviation: `(-2, 0, 2)`  
  - Variance:  
    $\frac{(4 + 0 + 4)}{3} = \frac{8}{3} \approx 2.67$
    
  - Standard Deviation:  
    $\sqrt{2.67} \approx 1.63$

### **6. COUNT()**
- **Purpose**: Counts the number of rows or non-NULL values in a column.
- **Usage**:
  ```sql
  SELECT COUNT(column_name) AS count_value FROM table_name;
  ```
- **How It Works**:
  - `COUNT(*)` counts all rows (including NULLs).
  - `COUNT(column_name)` counts non-NULL values in a column.
- **Example**:
  Given column: `[1, 2, NULL, 4]`
  - `COUNT(column_name)` = **3**
  - `COUNT(*)` = **4**


### **7. VARIANCE()**
- **Purpose**: Calculates the variance of a set of numeric values.
- **Usage**:
  ```sql
  SELECT VARIANCE(column_name) AS variance_value FROM table_name;
  ```
- **How It Works**:
  - Measures the spread of data around the mean.
  - Formula:
    \[
    \text{Variance} = \frac{\sum{(x_i - \bar{x})^2}}{N}
    \]
- **Example**:
  Values: `[10, 20, 30]`, Mean = 20
  - Deviation = `(-10, 0, 10)`
  - Variance = \((100 + 0 + 100) / 3 = 200 / 3 = 66.67\)


### **8. PERCENTILE_CONT()**
- **Purpose**: Calculates a continuous percentile (e.g., median, quartiles) using interpolation.
- **Usage**:
  ```sql
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY column_name) AS median_value FROM table_name;
  ```
- **How It Works**:
  - Sorts the values in ascending order.
  - Finds the fractional rank corresponding to the percentile.
  - Interpolates between adjacent values if necessary.
- **Example**:
  Values: `[10, 20, 30, 40]`, Median (50th percentile) = `(20 + 30) / 2 = 25`.


### **9. PERCENTILE_DISC()**
- **Purpose**: Calculates a discrete percentile, returning the nearest value without interpolation.
- **Usage**:
  ```sql
  SELECT PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY column_name) AS median_value FROM table_name;
  ```
- **Example**:
  Values: `[10, 20, 30, 40]`, Median (50th percentile) = **20**.


These aggregate functions are powerful tools for summarizing and analyzing data efficiently. Let me know if you'd like more examples or use cases for any of them!


---

## `PERCENTILE_CONT` function

The `PERCENTILE_CONT` function in PostgreSQL is used to calculate a specific percentile of a set of values. It’s part of the ordered-set aggregate functions, which allow advanced analytics based on the order of data. 

Here's a detailed explanation of the function in your query:

### **Syntax**
```sql
PERCENTILE_CONT(fraction) WITHIN GROUP (ORDER BY column_name) AS alias
```
### **Example**
```sql
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY base_msrp) AS median_base_msrp
```

### **Components**
1. **`PERCENTILE_CONT(fraction)`**:
   - The `fraction` represents the percentile you want to compute.
   - It must be a value between `0` and `1`.
     - For the median, use `0.5` (50th percentile).
     - For the 90th percentile, use `0.9`.

2. **`WITHIN GROUP (ORDER BY column_name)`**:
   - Specifies the column (`base_msrp` in this case) to calculate the percentile on.
   - The values in the column are sorted in ascending order before the calculation.

3. **`AS alias`**:
   - Assigns a name (`median_base_msrp` in your example) to the calculated result for readability.

### **How It Works**
- The function finds the position in the sorted dataset that corresponds to the specified percentile. 
- If the exact position is not a whole number (e.g., if the dataset has an even number of elements for the median), it **interpolates** between the two closest values.

### **Example**
Suppose the `base_msrp` column contains these values:
```
[200, 300, 400, 500, 600]
```

- To calculate the **median** (50th percentile):
  1. Sort the values: `[200, 300, 400, 500, 600]`.
  2. Find the middle value:
     - If the dataset has an odd number of elements, the middle value is the median.
     - If even, the median is the average of the two middle values.
     - Here, `400` is the middle value, so the median is `400`.

If the values were `[200, 300, 500, 600]`:
  - The median is `(300 + 500) / 2 = 400`.

### **Key Notes**
- **Continuous Percentiles**: The `PERCENTILE_CONT` function assumes continuous data. Interpolation occurs if the exact value does not exist in the data.
- **Alternative**: PostgreSQL also has `PERCENTILE_DISC` (discrete), which returns the nearest value in the dataset without interpolation.

By using this function, you can dynamically calculate a variety of percentiles, not just the median!

---

# Type Casting

In PostgreSQL, the `::` operator is used for type casting, allowing you to convert one data type to another. While `::numeric` is commonly used for converting values to a numeric type for precise calculations, there are other type casting options depending on your use case.

### **Common Type Casting Options in PostgreSQL**

1. **Integer**
   - **Usage**: Convert a value to an integer.
   ```sql
   SELECT 12.5::integer; -- Result: 12
   ```
   - **Purpose**: Removes the fractional part and returns an integer.

2. **Text**
   - **Usage**: Convert a value to a text type.
   ```sql
   SELECT 12345::text; -- Result: '12345'
   ```
   - **Purpose**: Useful for concatenation or formatting.

3. **Float**
   - **Usage**: Convert a value to a floating-point type.
   ```sql
   SELECT 123::float; -- Result: 123.0
   ```
   - **Purpose**: To ensure the value is treated as a floating-point number.

4. **Double Precision**
   - **Usage**: Convert a value to a double precision type.
   ```sql
   SELECT 123.45::double precision; -- Result: 123.45
   ```
   - **Purpose**: For high-precision floating-point calculations.

5. **Boolean**
   - **Usage**: Convert a value to a boolean.
   ```sql
   SELECT 1::boolean; -- Result: true
   SELECT 0::boolean; -- Result: false
   ```
   - **Purpose**: To represent true/false values.

6. **Date**
   - **Usage**: Convert a value to a date.
   ```sql
   SELECT '2024-12-06'::date; -- Result: 2024-12-06
   ```
   - **Purpose**: Converts a string or timestamp into a `date` type.

7. **Timestamp**
   - **Usage**: Convert a value to a timestamp.
   ```sql
   SELECT '2024-12-06 14:00:00'::timestamp; -- Result: 2024-12-06 14:00:00
   ```
   - **Purpose**: Useful for handling datetime values.

8. **JSON/JSONB**
   - **Usage**: Convert a value to JSON or JSONB format.
   ```sql
   SELECT '{"key": "value"}'::json; -- Result: {"key": "value"}
   SELECT '{"key": "value"}'::jsonb; -- Result: {"key": "value"}
   ```
   - **Purpose**: For handling structured data.

9. **Array**
   - **Usage**: Convert a value to an array type.
   ```sql
   SELECT '{1,2,3}'::int[]; -- Result: {1,2,3}
   ```
   - **Purpose**: Useful for storing multiple values in a single column.

10. **UUID**
    - **Usage**: Convert a value to a UUID type.
    ```sql
    SELECT '550e8400-e29b-41d4-a716-446655440000'::uuid;
    ```
    - **Purpose**: To handle universally unique identifiers.

11. **Interval**
    - **Usage**: Convert a value to an interval type.
    ```sql
    SELECT '1 day'::interval; -- Result: 1 day
    ```
    - **Purpose**: For representing time intervals.

12. **Bytea**
    - **Usage**: Convert a value to a binary string type.
    ```sql
    SELECT 'hello'::bytea; -- Result: \x68656c6c6f
    ```
    - **Purpose**: Useful for storing binary data.

---

### **Explicit Casting Using `CAST`**
Instead of using `::`, you can also use the `CAST` function for type conversion:

```sql
SELECT CAST(123.45 AS integer); -- Result: 123
SELECT CAST('2024-12-06' AS date); -- Result: 2024-12-06
```

### **Choosing the Right Option**
- **`::numeric`**: Use when precision is essential for calculations.
- **`::integer`**: Use when working with whole numbers.
- **`::text`**: Use for display or string operations.
- **`::float` or `::double precision`**: Use for floating-point arithmetic.
- **`::boolean`**: Use for conditional or logical operations.
- **`::date`/`::timestamp`**: Use for date/time operations.

---

# **General Syntax of `GROUP BY` and `HAVING` in SQL**

The `GROUP BY` clause is used to group rows with the same values in specified columns into summary rows, like "total revenue by region." The `HAVING` clause is then used to filter groups based on aggregate conditions.

---

### **Syntax**
```sql
SELECT 
    column1, 
    column2, 
    AGGREGATE_FUNCTION(column3) 
FROM 
    table_name
WHERE 
    condition
GROUP BY 
    column1, column2
HAVING 
    aggregate_condition;
```

---

### **Explanation of Key Parts**
1. **`SELECT` Clause**:
   - Lists the columns to display.
   - Can include aggregate functions (e.g., `SUM`, `AVG`) applied to columns.

2. **`WHERE` Clause**:
   - Filters rows before grouping.
   - Does not work with aggregate functions.

3. **`GROUP BY` Clause**:
   - Groups rows sharing the same values in the specified columns.
   - Each group produces a single result row.

4. **`HAVING` Clause**:
   - Filters groups based on conditions involving aggregate functions.
   - Applied after grouping.

5. **Aggregate Functions**:
   - Examples: `SUM`, `AVG`, `COUNT`, `MIN`, `MAX`.

---

### **Example 1: Simple Grouping**
```sql
SELECT 
    department, 
    COUNT(employee_id) AS total_employees 
FROM 
    employees
GROUP BY 
    department;
```
- **Explanation**:
  - Groups rows by the `department`.
  - Counts the number of employees in each department.

---

### **Example 2: Using `HAVING` with Conditions**
```sql
SELECT 
    department, 
    AVG(salary) AS avg_salary 
FROM 
    employees
GROUP BY 
    department
HAVING 
    AVG(salary) > 50000;
```
- **Explanation**:
  - Groups rows by the `department`.
  - Filters groups to show only departments where the average salary is greater than $50,000.

---

### **Example 3: Combining `WHERE` and `HAVING`**
```sql
SELECT 
    category, 
    SUM(sales) AS total_sales 
FROM 
    orders
WHERE 
    order_date >= '2024-01-01'
GROUP BY 
    category
HAVING 
    SUM(sales) > 10000;
```
- **Explanation**:
  - `WHERE` filters rows with an order date in 2024 or later.
  - `GROUP BY` groups rows by `category`.
  - `HAVING` filters groups where the total sales exceed $10,000.

---

### **Key Differences: `WHERE` vs `HAVING`**
| **Aspect**        | **WHERE**                                   | **HAVING**                                |
|--------------------|---------------------------------------------|-------------------------------------------|
| **Filters**        | Rows before grouping.                      | Groups after aggregation.                 |
| **Use with Aggregates** | Cannot use aggregate functions.          | Can use aggregate functions.              |
| **Application Order** | Applied first.                           | Applied after `GROUP BY`.                 |

Let me know if you'd like additional examples or clarification!
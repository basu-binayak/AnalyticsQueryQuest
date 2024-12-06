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
    ```math
    \frac{(4 + 0 + 4)}{3} = \frac{8}{3} \approx 2.67
    ```
  - Standard Deviation:  
    ```math
    \sqrt{2.67} \approx 1.63
    ```

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



## `PERCENTILE_CONT` function

The `PERCENTILE_CONT` function in PostgreSQL is used to calculate a specific percentile of a set of values. It’s part of the ordered-set aggregate functions, which allow advanced analytics based on the order of data. 

Here's a detailed explanation of the function in your query:

### **Syntax**
```sql
PERCENTILE_CONT(fraction) WITHIN GROUP (ORDER BY column_name) AS alias
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
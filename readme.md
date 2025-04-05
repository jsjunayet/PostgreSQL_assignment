
## 1. What is PostgreSQL?
PostgreSQL is an advanced, open-source relational database management system (RDBMS). It provides strong data integrity, and support for complex queries, making it ideal for web applications, analytics, and large-scale data processing.

## 2. What is the purpose of a database schema in PostgreSQL?
A database schema in PostgreSQL helps organize database objects like tables, views, and indexes. It allows better management, security, and separation of different parts of an application.

## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
- **Primary Key:** A unique column in a table that identifies each row.
- **Foreign Key:** A column that links to a primary key in another table, maintaining referential integrity.

### Example:
```sql
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    order_date DATE DEFAULT CURRENT_DATE
);
```

## 4. What is the difference between the VARCHAR and CHAR data types?
- **VARCHAR:** Stores variable-length text, using only necessary space.
- **CHAR:** Stores fixed-length text, always occupying the defined space.

### Example:
```sql
CREATE TABLE users (
    fullName VARCHAR(50),
    gender CHAR(10)
);
```

## 5. Explain the purpose of the WHERE clause in a SELECT statement.
The `WHERE` clause filters records in a query based on conditions.
### Example:
```sql
SELECT * FROM customers WHERE email = 'jsjunayet@gmail.com';
```

## 6. What are the LIMIT and OFFSET clauses used for?
- `LIMIT` restricts the number of rows.
- `OFFSET` skips a number of rows before displaying results.

### Example:
```sql
SELECT * FROM orders ORDER BY order_date DESC LIMIT 5 OFFSET 10;
```

## 7. How can you modify data using UPDATE statements?
The `UPDATE` statement changes existing records.

### Example:
```sql
UPDATE customers SET email = 'junayetshiblu0@gmail.com' WHERE id = 1;
```

## 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
`JOIN` combines data from multiple tables based on relationships.

### Example:
```sql
SELECT customers.name, orders.order_date
FROM customers
JOIN orders ON customers.id = orders.customer_id;
```

## 9. Explain the GROUP BY clause and its role in aggregation operations.
The `GROUP BY` clause groups records and is used with aggregate functions.

### Example:
```sql
SELECT customer_id, COUNT(id) AS total_orders
FROM orders
GROUP BY customer_id;
```

## 10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
PostgreSQL provides functions to calculate summary statistics.

### Examples:
```sql
SELECT COUNT(*) FROM orders;
SELECT SUM(price) FROM books;
SELECT AVG(price) FROM books;
```

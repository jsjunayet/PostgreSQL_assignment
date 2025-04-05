-- Active: 1743474425224@@127.0.0.1@5432@bookstore_db
-- Create books Table Command
CREATE Table books(
    id INT PRIMARY key,
    title VARCHAR(200),
    author VARCHAR(100),
    price DECIMAL(10,2) Check(price>=0),
    stock INT,
    published_year INT
);
--Value Insert in the Book table command
INSERT into books VALUES
(1, 'The Pragmatic Programmer', 'Andrew Hunt', 40, 10, 1999),
(2, 'Clean Code', 'Robert C. Martin', 35, 5, 2008),
(3, 'You Don''t Know JS', 'Kyle Simpson', 30, 8, 2014),
(4, 'Refactoring', 'Martin Fowler', 50, 3, 1999),
(5, 'Database Design Principles', 'Jane Smith', 20, 0, 2018);

-- Create customers Table Command
CREATE Table customers(
    id INT PRIMARY key,
    name VARCHAR(200),
    email VARCHAR(100) UNIQUE,
    joined_date DATE DEFAULT CURRENT_DATE
);

--Value Insert in the customers table command
INSERT INTO customers VALUES
(1, 'Alice', 'alice@email.com', '2023-01-10'),
(2, 'Bob', 'bob@email.com', '2022-05-15'),
(3, 'Charlie', 'charlie@email.com', '2023-06-20');

-- Create orders Table Command
CREATE TABLE orders(
    id INT PRIMARY key,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    book_id INT REFERENCES books(id) ON DELETE CASCADE,
    quantity INT CHECK(quantity>0),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--Value Insert in the orders table command
INSERT INTO orders (id, customer_id, book_id, quantity, order_date) VALUES
(1, 1, 2, 1, '2024-03-10'),
(2, 2, 1, 1, '2024-02-20'),
(3, 1, 3, 2, '2024-03-05');

--1️⃣ Find books that are out of stock.

SELECT title 
FROM books
WHERE stock = 0;
--SELECT title FROM books  Gets the book titles from the books table.
--WHERE stock = 0  Only shows books where the stock is zero (out of stock).

--2️⃣ Retrieve the most expensive book in the store.
SELECT * FROM books
WHERE price= (SELECT MAX(price) FROM books);
--SELECT MAX(price) FROM books  Finds the highest price from the books table.
--SELECT * FROM books WHERE price = (highest price)  Shows all details of the book that has the highest price.

--3️⃣ Find the total number of orders placed by each customer.
SELECT customers.name, count(orders.id) as total_orders FROM customers
INNER JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name;
--INNER JOIN orders ON customers.id = orders.customer_id  Connects the customers and orders tables.
--COUNT(orders.id)  Counts how many orders each customer has placed.
--GROUP BY customers.name  Groups the results by customer name.

--4️⃣ Calculate the total revenue generated from book sales.
SELECT SUM(books.price * orders.quantity) AS total_revenue FROM orders
INNER JOIN books ON orders.book_id=books.id;
--INNER JOIN books ON orders.book_id=books.id  Connects the orders and books tables.
--books.price * orders.quantity  Calculates total price for each order.
--SUM(books.price * orders.quantity)  Adds up all the total prices to get total revenue.


--5️⃣ List all customers who have placed more than one order.
SELECT c.id, c.name, c.email, COUNT(o.id) AS total_orders
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name, c.email
HAVING COUNT(o.id) > 1;

--JOIN  Links the customers and orders tables.
--GROUP BY c.id, c.name, c.email  Groups results for each customer.
--HAVING COUNT(o.id) > 1  Only shows customers who placed more than one order.


--6️⃣ Find the average price of books in the store.
SELECT AVG(price) AS average_book_price FROM books;
--AVG(price)  Calculates the average price of all books in the books table.


--7️⃣ Increase the price of all books published before 2000 by 10%.
UPDATE books
SET price = price * 1.10
WHERE published_year < 2000;
--SET price = price * 1.10 → Increases the price by 10%.
--WHERE published_year < 2000 → Only applies to books published before the year 2000.

--8️⃣ Delete customers who haven't placed any orders.
DELETE FROM customers
WHERE id NOT IN (SELECT DISTINCT customer_id FROM orders);
--SELECT DISTINCT customer_id FROM orders  Finds customers who have placed orders.
--WHERE id NOT IN (customers who have placed orders)  Deletes customers who are not in this list.








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

--2️⃣ Retrieve the most expensive book in the store.
SELECT * FROM books
WHERE price= (SELECT MAX(price) FROM books);

--3️⃣ Find the total number of orders placed by each customer.

--4️⃣ Calculate the total revenue generated from book sales.
--5️⃣ List all customers who have placed more than one order.
--6️⃣ Find the average price of books in the store.
--7️⃣ Increase the price of all books published before 2000 by 10%.
--8️⃣ Delete customers who haven't placed any orders.








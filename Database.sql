CREATE DATABASE retail_store;

-- Create tables
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address TEXT
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers(customer_id) ON DELETE CASCADE,
    order_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id INT NOT NULL REFERENCES products(product_id),
    quantity INT NOT NULL CHECK (quantity > 0),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0)
);

CREATE TABLE bank_accounts (
    account_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers(customer_id) ON DELETE CASCADE,
    balance DECIMAL(12,2) NOT NULL CHECK (balance >= 0)
);


-- Sample customers
INSERT INTO customers (name, email, address)
VALUES ('Vansh Patel', 'pvansh@gmail.com', '123 naka St'),
       ('Ansh Patel', 'ansh@gmail.com', '456 naka Ave'),
       ('Esha Patel', 'esha@gmail.com', '789 naka St'),
       ('Saleh Patel', 'salouhi@gmail.com', '321 naka St'),
       ('Akshay Patel', 'akshay@gmail.com', '213 naka St'),
       ('Natasha Patel', 'nat@gmail.com', '231 naka St');



/*Query 1: Customers who have not placed any orders*/
SELECT * FROM customers
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id FROM orders
);

/*Query 2: Total revenue generated from orders*/
SELECT SUM(quantity * price) AS total_revenue
FROM order_items;

/*Query 3: Top 5 products with highest sales revenue*/
SELECT p.name, SUM(oi.quantity * oi.price) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.name
ORDER BY revenue DESC
LIMIT 5;

/*Query 4: Update customer address by customer ID*/
UPDATE customers
SET address = 'New Address Example'
WHERE customer_id = 1;

/*Query 5: Transaction to transfer funds*/
BEGIN;

-- Deduct from source
UPDATE bank_accounts
SET balance = balance - 100.00
WHERE account_id = 1;

-- Add to destination
UPDATE bank_accounts
SET balance = balance + 100.00
WHERE account_id = 2;

COMMIT;

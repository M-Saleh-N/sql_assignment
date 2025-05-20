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
SET address = '444 naka st'
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
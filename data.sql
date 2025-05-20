-- Sample customers
INSERT INTO customers (name, email, address)
VALUES ('Vansh Patel', 'pvansh@gmail.com', '123 naka St'),
       ('Ansh Patel', 'ansh@gmail.com', '456 naka Ave'),
       ('Esha Patel', 'esha@gmail.com', '789 naka St'),
       ('Saleh Patel', 'salouhi@gmail.com', '321 naka St'),
       ('Akshay Patel', 'akshay@gmail.com', '213 naka St'),
       ('Natasha Patel', 'nat@gmail.com', '231 naka St');

-- Sample products
INSERT INTO products (name, price)
VALUES ('Laptop', 120000), ('Mouse', 1500), ('Keyboard', 2500), ('HDMI', 500), ('Monitor', 80000);

-- Sample order
INSERT INTO orders (customer_id) VALUES (1);  -- Vansh's order

-- Sample order items
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES (1, 1, 1, 120000),  -- 1 Laptop
       (1, 2, 2, 1500);    -- 2 Mice

-- Sample bank accounts
INSERT INTO bank_accounts (customer_id, balance)
VALUES 
  (1, 150000.00),
  (2, 30000.00);


# 🛒 Retail Store Database Management — Advanced SQL Assignment

This project demonstrates advanced SQL operations for managing a retail store database using PostgreSQL. It includes database schema design, data population, complex queries, and transaction handling.

---

## 📂 Project Structure

- `schema.sql` – Contains all `CREATE TABLE` statements for setting up the database.
- `data.sql` – Inserts sample data for customers, products, orders, order items, and bank accounts.
- `queries.sql` – Contains all required SQL queries.
- `README.md` – This file, documenting the project.

---

## 🧱 Database Schema Description

### Tables Created:

1. **`customers`**
   - `customer_id` (Primary Key)
   - `name`, `email`, `address`

2. **`products`**
   - `product_id` (Primary Key)
   - `name`, `price`

3. **`orders`**
   - `order_id` (Primary Key)
   - `customer_id` (Foreign Key → customers)

4. **`order_items`**
   - `order_item_id` (Primary Key)
   - `order_id` (Foreign Key → orders)
   - `product_id` (Foreign Key → products)
   - `quantity`, `price`

5. **`bank_accounts`**
   - `account_id` (Primary Key)
   - `customer_id` (Foreign Key → customers)
   - `balance`

All tables include relevant constraints like `NOT NULL`, `UNIQUE`, `CHECK`, and cascading foreign keys for referential integrity.

---

## 💾 Setup Instructions

1. Open PostgreSQL shell and connect as a user (e.g., `postgres`):
   ```bash
   psql -U postgres

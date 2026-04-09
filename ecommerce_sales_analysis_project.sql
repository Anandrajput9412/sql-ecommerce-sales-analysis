CREATE DATABASE ecommerce_project;

USE ecommerce_project;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    gender VARCHAR(20),
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(200),
    category VARCHAR(50),
    price DECIMAL(10,2),
    rating DECIMAL(3,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    total_amount DECIMAL(10,2)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    item_price DECIMAL(10,2)
);

SELECT * FROM users;

SELECT SUM(total_amount) AS total_revenue
FROM orders;
SELECT * FROM users LIMIT 5;
SELECT * FROM products LIMIT 5;
SELECT * FROM orders LIMIT 5;
SELECT * FROM order_items LIMIT 5;
SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SHOW TABLES;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;

SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM products;

SELECT SUM(item_total) AS total_revenue
FROM order_items;

SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 10;

DESC products;

DROP TABLE products;

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(255),
    category VARCHAR(100),
    brand VARCHAR(100),
    price DECIMAL(10,2),
    rating DECIMAL(3,2)
);

DESC products;
SELECT * FROM products LIMIT 5;

SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 10;

SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 10;
DROP TABLE IF EXISTS products;

LOAD DATA LOCAL INFILE '/Users/anandrajput/Downloads/ecommerce_dataset/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM products LIMIT 5;
TRUNCATE TABLE products;

LOAD DATA LOCAL INFILE '/Users/anandrajput/Downloads/ecommerce_dataset/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, product_name, category, brand, price, rating);
DESC products;

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id VARCHAR(20),
    product_name VARCHAR(255),
    category VARCHAR(100),
    brand VARCHAR(100),
    price DECIMAL(10,2),
    rating DECIMAL(3,2)
);
SELECT COUNT(*) FROM products;
SELECT * FROM products LIMIT 5;
DESC order_items;

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id VARCHAR(20),
    product_name VARCHAR(255),
    category VARCHAR(100),
    brand VARCHAR(100),
    price DOUBLE,
    rating DOUBLE
);

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id VARCHAR(20),
    product_name VARCHAR(255),
    category VARCHAR(100),
    brand VARCHAR(100),
    price DOUBLE,
    rating DOUBLE
);

SELECT COUNT(*) FROM products;

SELECT * FROM products LIMIT 5;

SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 10;

SELECT 
    SUM(item_total) AS total_revenue
FROM order_items;

SELECT 
    MONTH(o.order_date) AS month,
    SUM(oi.item_total) AS monthly_sales
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY MONTH(o.order_date)
ORDER BY month;

SELECT 
    user_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY user_id
HAVING COUNT(order_id) > 1
ORDER BY total_orders DESC;

SELECT SUM(item_total) AS total_revenue
FROM order_items;

SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 10;

SELECT 
    MONTH(o.order_date) AS month,
    SUM(oi.item_total) AS monthly_sales
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY MONTH(o.order_date)
ORDER BY month;

SELECT 
    p.category,
    SUM(oi.item_total) AS total_sales
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

SELECT 
    user_id,
    SUM(item_total) AS total_spent
FROM order_items
GROUP BY user_id
ORDER BY total_spent DESC
LIMIT 10;

SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
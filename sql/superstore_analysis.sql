CREATE DATABASE superstore_db;
USE superstore_db;
CREATE TABLE orders (
    row_id INT,
    order_id VARCHAR(20),
    order_date VARCHAR(20),
    ship_date VARCHAR(20),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code INT,
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(200),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    profit DECIMAL(10,2)
);
UPDATE orders
SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y');
UPDATE orders
SET ship_date = STR_TO_DATE(ship_date, '%d-%m-%Y');
SELECT COUNT(*) FROM orders;
SELECT * FROM orders LIMIT 5;
DELETE FROM orders
WHERE sales <= 0 OR quantity <= 0;
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity,
    ROUND(AVG(profit),2) AS avg_profit
FROM orders;
SELECT
    category,
    SUM(sales) AS category_sales,
    SUM(profit) AS category_profit
FROM orders
GROUP BY category
ORDER BY category_sales DESC;
SELECT
    region,
    SUM(profit) AS total_profit
FROM orders
GROUP BY region
ORDER BY total_profit DESC;
SELECT
    product_name,
    SUM(profit) AS total_profit
FROM orders
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit;
SELECT
    DATE_FORMAT(order_date,'%Y-%m') AS month,
    SUM(sales) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;




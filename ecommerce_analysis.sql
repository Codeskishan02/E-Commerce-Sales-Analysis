ecommerce_analysis.sql
-- E-Commerce Sales & Order Analysis
-- Database: ecommerce_db
-- Table: ecommerce_orders
USE ecommerce_db;
-- Total Sales
SELECT ROUND(SUM(Sales_Amount), 2) AS total_sales
FROM ecommerce_orders;
-- Total Orders
SELECT COUNT(*) AS total_orders
FROM ecommerce_orders;
-- Total Quantity Sold
SELECT SUM(Quantity) AS total_quantity
FROM ecommerce_orders;
-- Average Order Value
SELECT ROUND(AVG(Sales_Amount), 2) AS average_order_value
FROM ecommerce_orders;
-- Category-wise Sales
SELECT
    Category,
    ROUND(SUM(Sales_Amount), 2) AS total_sales
FROM ecommerce_orders
GROUP BY Category
ORDER BY total_sales DESC;
-- City-wise Sales
SELECT
    City,
    ROUND(SUM(Sales_Amount), 2) AS total_sales
FROM ecommerce_orders
GROUP BY City
ORDER BY total_sales DESC;
-- Order Status Analysis
SELECT
    Order_Status,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales_Amount), 2) AS total_sales
FROM ecommerce_orders
GROUP BY Order_Status
ORDER BY total_orders DESC;
-- Payment Method Analysis
SELECT
    Payment_Method,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales_Amount), 2) AS total_sales
FROM ecommerce_orders
GROUP BY Payment_Method
ORDER BY total_sales DESC;
-- Top 10 Products
SELECT
    Product,
    SUM(Quantity) AS units_sold,
    ROUND(SUM(Sales_Amount), 2) AS total_sales
FROM ecommerce_orders
GROUP BY Product
ORDER BY total_sales DESC
LIMIT 10;
-- Top 10 Customers
SELECT
    Customer_ID,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales_Amount), 2) AS total_spent
FROM ecommerce_orders
GROUP BY Customer_ID
ORDER BY total_spent DESC
LIMIT 10;
-- Monthly Sales
SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS month,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales_Amount), 2) AS total_sales
FROM ecommerce_orders
GROUP BY month
ORDER BY month;
-- Delivered Orders Sales
SELECT
    COUNT(*) AS delivered_orders,
    ROUND(SUM(Sales_Amount), 2) AS delivered_sales
FROM ecommerce_orders
WHERE Order_Status = 'Delivered';
-- High Value Orders
SELECT
    Order_ID,
    Customer_ID,
    Product,
    Sales_Amount
FROM ecommerce_orders
WHERE Sales_Amount > 2000
ORDER BY Sales_Amount DESC;
-- Highest Value Order
SELECT
    Order_ID,
    Customer_ID,
    Product,
    Category,
    Sales_Amount
FROM ecommerce_orders
ORDER BY Sales_Amount DESC
LIMIT 1;
-- Discount Analysis
SELECT
    CASE
        WHEN Discount_Rate = 0 THEN 'No Discount'
        WHEN Discount_Rate <= 0.10 THEN 'Low Discount'
        ELSE 'High Discount'
    END AS discount_type,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales_Amount), 2) AS total_sales
FROM ecommerce_orders
GROUP BY discount_type
ORDER BY total_sales DESC;
-- Categories with Sales Above ₹50,000
SELECT
    Category,
    ROUND(SUM(Sales_Amount), 2) AS total_sales
FROM ecommerce_orders
GROUP BY Category
HAVING SUM(Sales_Amount) > 50000
ORDER BY total_sales DESC;
-- Order Performance Classification
SELECT
    Order_ID,
    Sales_Amount,
    CASE
        WHEN Sales_Amount >= 3000 THEN 'High Value'
        WHEN Sales_Amount >= 1500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_type
FROM ecommerce_orders
ORDER BY Sales_Amount DESC;
-- Cancelled Orders
SELECT
    Order_ID,
    Customer_ID,
    Product,
    Sales_Amount
FROM ecommerce_orders
WHERE Order_Status = 'Cancelled'
ORDER BY Sales_Amount DESC;
-- Returned Orders
SELECT
    Order_ID,
    Customer_ID,
    Product,
    Sales_Amount
FROM ecommerce_orders
WHERE Order_Status = 'Returned'
ORDER BY Sales_Amount DESC;
-- Customer Purchase Summary
SELECT
    Customer_ID,
    COUNT(*) AS total_orders,
    SUM(Quantity) AS total_quantity,
    ROUND(SUM(Sales_Amount), 2) AS total_spent,
    ROUND(AVG(Sales_Amount), 2) AS average_order_value
FROM ecommerce_orders
GROUP BY Customer_ID
ORDER BY total_spent DESC;
ecommerce_analysis.sql
E-Commerce-Sales-Analysis/
│
├── ecommerce_analysis.sql
├── ecommerce_orders_cleaned.csv
└── README.md
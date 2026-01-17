/* =========================================================
   PROJECT 1: BUSINESS & OPERATIONS KPI ANALYTICS
   TOOL: MySQL Workbench
   ========================================================= */

-- =========================================================
-- 1. DATABASE 
-- =========================================================
CREATE DATABASE ops_kpi_db;
USE ops_kpi_db;

-- =========================================================
-- 2. TABLE CREATION 
-- =========================================================
CREATE TABLE operations_data (
    row_id INT,
    order_id VARCHAR(50),
    order_date VARCHAR(20),
    ship_date VARCHAR(20),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code INT,
    region VARCHAR(50),
    retail_sales_people VARCHAR(100),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    returned VARCHAR(10),
    sales DECIMAL(15,4),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(15,4),
    delivery_days INT,
    sla_days INT,
    delay_days INT,
    delivery_status VARCHAR(20)
);

-- =========================================================
-- 3. DATA LOAD (SERVER-SIDE, SECURE)
-- =========================================================
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_operations_data_utf8.csv'
INTO TABLE operations_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- =========================================================
-- 4. BASIC VALIDATION
-- =========================================================
SELECT COUNT(*) AS total_rows FROM operations_data;

-- =========================================================
-- 5. DATE CONVERSION (TEXT → DATE)
-- =========================================================
SET SQL_SAFE_UPDATES = 0;

UPDATE operations_data
SET
    order_date = STR_TO_DATE(order_date, '%d-%m-%Y'),
    ship_date  = STR_TO_DATE(ship_date,  '%d-%m-%Y');

ALTER TABLE operations_data
MODIFY order_date DATE,
MODIFY ship_date  DATE;

-- =========================================================
-- 6. FINAL DATA CHECK
-- =========================================================
SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM operations_data;

-- =========================================================
-- 7. BUSINESS KPI ANALYSIS 
-- =========================================================

-- 7.1 Total Sales & Profit
SELECT
    ROUND(SUM(sales), 2)  AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM operations_data;

-- 7.2 Average Order Value (AOV)
SELECT
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM operations_data;

-- =========================================================
-- 8. OPERATIONS & SLA ANALYTICS
-- =========================================================

-- 8.1 SLA Compliance %
SELECT
    delivery_status,
    COUNT(*) AS orders,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM operations_data), 2) AS percentage
FROM operations_data
GROUP BY delivery_status;

-- 8.2 Average Delivery Time
SELECT
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days
FROM operations_data;

-- =========================================================
-- 9. ROOT CAUSE ANALYSIS
-- =========================================================

-- 9.1 Delay % by Region
SELECT
    region,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN delivery_status = 'Delayed' THEN 1 ELSE 0 END) AS delayed_orders,
    ROUND(
        SUM(CASE WHEN delivery_status = 'Delayed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS delay_percentage
FROM operations_data
GROUP BY region
ORDER BY delay_percentage DESC;

-- 9.2 Delay % by Category
SELECT
    category,
    COUNT(*) AS total_orders,
    ROUND(
        SUM(CASE WHEN delivery_status = 'Delayed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS delay_percentage
FROM operations_data
GROUP BY category
ORDER BY delay_percentage DESC;

-- =========================================================
-- 10. TIME TREND ANALYSIS
-- =========================================================

-- 10.1 Monthly Delivery Trend
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days
FROM operations_data
GROUP BY order_month
ORDER BY order_month;

-- =========================================================
--  THE END 
-- =========================================================

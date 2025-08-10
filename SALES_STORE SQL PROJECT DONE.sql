CREATE DATABASE SALES_STORE;

CREATE TABLE SALES_STORE (
transaction_id VARCHAR (15),
customer_id VARCHAR (15),
customer_name VARCHAR (50),
customer_age INT,
gender VARCHAR (15),
product_id VARCHAR (15),
product_name VARCHAR (15),
product_category VARCHAR (15),
quantity INT,
price FLOAT,
payment_mode VARCHAR(50),
purchase_date DATE,
time_of_purchase TIME,
status VARCHAR (15)
);

SELECT * FROM SALES_STORE;

INSERT INTO sales_store VALUES
('TXN001', 'CUST001', 'Amit Sharma', 32, 'Male', 'PRD001', 'Laptop', 'Electronics', 1, 55000.00, 'Credit Card', '2025-08-01', '10:15:00', 'Completed'),
('TXN002', 'CUST002', 'Neha Patel', 27, 'Female', 'PRD002', 'T-Shirt', 'Apparel', 2, 799.50, 'UPI', '2025-08-01', '11:45:00', 'Completed'),
('TXN003', 'CUST003', 'Ravi Mehta', 45, 'Male', 'PRD003', 'Refrigerator', 'Appliances', 1, 32000.00, 'Debit Card', '2025-08-02', '14:30:00', 'Completed'),
('TXN004', 'CUST004', 'Sneha Joshi', 22, 'Female', 'PRD004', 'Notebook', 'Stationery', 5, 250.00, 'Cash', '2025-08-02', '16:10:00', 'Completed'),
('TXN005', 'CUST005', 'Karan Desai', 35, 'Male', 'PRD005', 'Smartphone', 'Electronics', 1, 18000.00, 'Net Banking', '2025-08-03', '12:00:00', 'Pending'),
('TXN006', 'CUST006', 'Priya Nair', 29, 'Female', 'PRD006', 'Shoes', 'Footwear', 1, 2999.99, 'Credit Card', '2025-08-03', '13:20:00', 'Completed'),
('TXN007', 'CUST007', 'Manish Verma', 40, 'Male', 'PRD007', 'Washing Machine', 'Appliances', 1, 25000.00, 'EMI', '2025-08-04', '15:45:00', 'Completed'),
('TXN008', 'CUST008', 'Ritika Shah', 31, 'Female', 'PRD008', 'Handbag', 'Accessories', 1, 1499.00, 'UPI', '2025-08-04', '17:30:00', 'Completed'),
('TXN009', 'CUST009', 'Arjun Singh', 38, 'Male', 'PRD009', 'Headphones', 'Electronics', 2, 3499.00, 'Credit Card', '2025-08-05', '09:50:00', 'Completed'),
('TXN010', 'CUST010', 'Meera Iyer', 26, 'Female', 'PRD010', 'Dress', 'Apparel', 1, 1299.00, 'Cash', '2025-08-05', '18:15:00', 'Cancelled');

-- DATA ANAYLSIS --
'Q1. what are the most top 5 most selling products by quantity' 

SELECT product_name,
SUM(quantity) AS total_quantity_sold
FROM SALES_STORE
WHERE status ='Completed'
GROUP BY product_name
ORDER BY total_quantity_sold  DESC
LIMIT 5;

'Q2.total customers by total spend'

SELECT customer_id, customer_name, SUM(quantity * price) AS total_spent
FROM SALES_STORE
GROUP BY customer_id, customer_name
ORDER BY total_spent DESC;

'Q3.find out best selling products'

SELECT product_name, SUM(quantity) AS total_sold
FROM SALES_STORE
GROUP BY product_name
ORDER BY total_sold DESC;

'Q4.find out product revenue'

SELECT product_category, SUM(quantity * price) AS revenue
FROM SALES_STORE
GROUP BY product_category;

'Q5.find out peak purchase hours'

SELECT time_of_purchase, COUNT(*) AS transactions
FROM SALES_STORE
GROUP BY time_of_purchase
ORDER BY transactions DESC; 

'Q6.find out preferred payment mode'

SELECT payment_mode, COUNT(*) AS usage_count
FROM SALES_STORE
GROUP BY payment_mode
ORDER BY usage_count DESC;

'Q7.failed vs successful transactions'

SELECT status, COUNT(*) AS count
FROM SALES_STORE
GROUP BY status;

'Q8.average purchase amount by age group'

SELECT 
    CASE 
        WHEN customer_age < 20 THEN 'Under 20'
        WHEN customer_age BETWEEN 20 AND 29 THEN 'YOUNG ADULT'
        WHEN customer_age BETWEEN 30 AND 39 THEN 'ADULT'
        WHEN customer_age BETWEEN 40 AND 49 THEN 'OLDER'
        ELSE 'SENIOR'
    END AS age_group,
    AVG(quantity * price) AS avg_purchase_amount
FROM SALES_STORE
GROUP BY age_group
ORDER BY age_group;

'Q9.find out most popular method of payment'

SELECT payment_mode, COUNT(*) AS transaction_count
FROM SALES_STORE
GROUP BY payment_mode
ORDER BY transaction_count DESC;

'Q10.find out monthly sales TREND'

SELECT 
    EXTRACT(YEAR FROM purchase_date) AS year,
    EXTRACT(MONTH FROM purchase_date) AS month,
    SUM(quantity * price) AS monthly_sales
FROM SALES_STORE
GROUP BY year, month
ORDER BY year, month;


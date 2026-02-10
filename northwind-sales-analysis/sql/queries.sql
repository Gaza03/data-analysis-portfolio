
-- =========================================
-- Northwind Sales Operations Analysis
-- =========================================
-- Database: Northwind (SQLite)
-- Focus: SQL joins, revenue analysis, business insights

-- -----------------------------------------
-- Query 1: Total Sales Revenue by Month
-- -----------------------------------------
SELECT
  strftime('%Y-%m', o.OrderDate) AS month,
  ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS revenue
FROM Orders o
JOIN "Order Details" od ON od.OrderID = o.OrderID
GROUP BY 1
ORDER BY 1;

-- -----------------------------------------
-- Query 2: Top 10 Products by Revenue
-- -----------------------------------------
SELECT
  p.ProductName,
  ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS revenue
FROM "Order Details" od
JOIN Products p ON p.ProductID = od.ProductID
GROUP BY 1
ORDER BY revenue DESC
LIMIT 10;

-- -----------------------------------------
-- Query 3: Top 10 Customers by Revenue
-- -----------------------------------------
SELECT
  c.CompanyName,
  ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS revenue
FROM Customers c
JOIN Orders o ON o.CustomerID = c.CustomerID
JOIN "Order Details" od ON od.OrderID = o.OrderID
GROUP BY 1
ORDER BY revenue DESC
LIMIT 10;

-- -----------------------------------------
-- Query 4: Sales by Employee
-- -----------------------------------------
SELECT
  e.FirstName || ' ' || e.LastName AS employee,
  ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS revenue
FROM Employees e
JOIN Orders o ON o.EmployeeID = e.EmployeeID
JOIN "Order Details" od ON od.OrderID = o.OrderID
GROUP BY 1
ORDER BY revenue DESC;

-- -----------------------------------------
-- Query 5: Average Order Value
-- -----------------------------------------
WITH order_totals AS (
  SELECT
    o.OrderID,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS order_value
  FROM Orders o
  JOIN "Order Details" od ON od.OrderID = o.OrderID
  GROUP BY o.OrderID
)
SELECT
  ROUND(AVG(order_value), 2) AS avg_order_value
FROM order_totals;

-- 1) Monthly revenue & profit
SELECT
  strftime('%Y-%m', "Order Date") AS month,
  ROUND(SUM(Sales), 2) AS revenue,
  ROUND(SUM(Profit), 2) AS profit,
  COUNT(DISTINCT "Order ID") AS orders
FROM superstore
GROUP BY 1
ORDER BY 1;

-- 2) Top 10 products by profit
SELECT
  "Product Name",
  ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY 1
ORDER BY total_profit DESC
LIMIT 10;

-- 3) Top 10 customers by revenue
SELECT
  "Customer Name",
  ROUND(SUM(Sales), 2) AS total_revenue,
  ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY 1
ORDER BY total_revenue DESC
LIMIT 10;

-- 4) Profit margin by category
SELECT
  Category,
  ROUND(SUM(Sales), 2) AS revenue,
  ROUND(SUM(Profit), 2) AS profit,
  ROUND(100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0), 2) AS profit_margin_pct
FROM superstore
GROUP BY 1
ORDER BY profit DESC;

-- 5) Category + Sub-Category breakdown
SELECT
  Category,
  "Sub-Category",
  ROUND(SUM(Sales), 2) AS revenue,
  ROUND(SUM(Profit), 2) AS profit
FROM superstore
GROUP BY 1, 2
ORDER BY profit DESC;


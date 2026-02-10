-- ================================
-- Global Superstore Sales Analysis
-- ================================

-- KPI CALCULATION
-- Full dataset revenue + Top 10 products by profit
-- --------------------------------
WITH top10(product) AS (
  VALUES
  ('Canon imageCLASS 2200 Advanced Copier'),
  ('Cisco Smart Phone, Full Size'),
  ('Motorola Smart Phone, Full Size'),
  ('Hoover Stove, Red'),
  ('Sauder Classic Bookcase, Traditional'),
  ('Harbour Creations Executive Leather Armchair, Adjustable'),
  ('Nokia Smart Phone, Full Size'),
  ('Cisco Smart Phone, with Caller ID'),
  ('Nokia Smart Phone, with Caller ID'),
  ('Belkin Router, USB')
),
cleaned AS (
  SELECT
    "Product Name" AS product,

    -- Sales cleaned to REAL (handles currency, spaces, comma decimals)
    CAST(
      REPLACE(
        REPLACE(
          REPLACE(
            REPLACE(
              CASE
                WHEN "Sales" LIKE '(%' AND "Sales" LIKE '%)' THEN '-' || REPLACE(REPLACE("Sales",'(',''),')','')
                ELSE "Sales"
              END,
            'R',''),
          '$',''),
        ' ',''),
      ',', '.'
      ) AS REAL
    ) AS sales_num,

    -- Profit cleaned to REAL (same logic)
    CAST(
      REPLACE(
        REPLACE(
          REPLACE(
            REPLACE(
              CASE
                WHEN "Profit" LIKE '(%' AND "Profit" LIKE '%)' THEN '-' || REPLACE(REPLACE("Profit",'(',''),')','')
                ELSE "Profit"
              END,
            'R',''),
          '$',''),
        ' ',''),
      ',', '.'
      ) AS REAL
    ) AS profit_num
  FROM superstore
),
totals AS (
  SELECT
    SUM(sales_num) AS total_revenue_all
  FROM cleaned
),
top10_profit AS (
  SELECT
    SUM(profit_num) AS total_profit_top10
  FROM cleaned
  WHERE product IN (SELECT product FROM top10)
)
SELECT
  ROUND(t.total_revenue_all, 2) AS total_revenue_all,
  ROUND(p.total_profit_top10, 2) AS total_profit_top10,
  ROUND(100.0 * p.total_profit_top10 / NULLIF(t.total_revenue_all, 0), 2) AS profit_margin_pct
FROM totals t
CROSS JOIN top10_profit p;


-- PROFIT BY CATEGORY
-- Full dataset category analysis
-- --------------------------------
WITH cleaned AS (
  SELECT
    Category,
    CAST(
      REPLACE(REPLACE(REPLACE(REPLACE(
        CASE
          WHEN "Profit" LIKE '(%' AND "Profit" LIKE '%)' THEN '-' || REPLACE(REPLACE("Profit",'(',''),')','')
          ELSE "Profit"
        END
      ,'R',''),'$',''),' ',''), ',', '.')
    AS REAL) AS profit_num
  FROM superstore
)
SELECT
  Category,
  ROUND(SUM(profit_num), 2) AS total_profit
FROM cleaned
GROUP BY Category
ORDER BY total_profit DESC;

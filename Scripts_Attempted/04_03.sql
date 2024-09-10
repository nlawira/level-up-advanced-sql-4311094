SELECT
  strftime('%Y-%m', soldDate) soldMonth,
  COUNT(*) as CarsSold,
  LAG(COUNT(*),1,0) OVER (ORDER BY strftime('%Y-%m', soldDate) ASC) LastMonthCarsSold
FROM sales s
GROUP BY soldMonth
ORDER BY soldMonth ASC;

-- Alternative using WINDOW statment, defining the field name for use in a window function
SELECT
  strftime('%Y-%m', soldDate) soldMonth,
  COUNT(*) as CarsSold,
  LAG(COUNT(*),1,0) OVER calMonth LastMonthCarsSold
FROM sales s
GROUP BY soldMonth
WINDOW calMonth AS (ORDER BY strftime('%Y-%m', soldDate) ASC)
ORDER BY soldMonth ASC;
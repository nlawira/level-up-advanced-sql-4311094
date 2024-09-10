-- CTE = Common Table Expression

WITH CTE as (
SELECT
  strftime('%Y', soldDate) SoldYear, 
  salesAmount
FROM sales
)
SELECT
  SoldYear,
  FORMAT('$%.2f', SUM(salesAmount)) AnnualSalesAmount
FROM CTE
GROUP BY SoldYear
ORDER BY SoldYear ASC;
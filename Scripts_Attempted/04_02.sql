WITH CTE AS (
  SELECT
    SUM(salesAmount) AS monthlyTotal,
    strftime('%m', soldDate) soldMonth,
    strftime('%Y', soldDate) soldYear
  FROM sales s
  GROUP BY
    soldYear,
    soldMonth
)

SELECT
  soldYear,
  soldMonth,
  FORMAT('$%.2f', monthlyTotal) as monthlyTotal,
  FORMAT('$%.2f', SUM(monthlyTotal) OVER (PARTITION BY soldYear ORDER BY soldYear, soldMonth ASC)) AS AnnualRunningTotal
FROM CTE
ORDER BY
  soldYear ASC,
  soldMonth ASC;
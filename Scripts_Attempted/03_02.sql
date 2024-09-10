WITH CTE AS(
SELECT
  e.employeeId,
  e.lastName,
  e.firstName,
  strftime('%m', s.soldDate) soldMonth,
  sum(s.salesAmount) as totalSales
FROM sales s
INNER JOIN employee e
ON e.employeeId = s.employeeId
WHERE strftime('%Y', s.soldDate) = '2021'
GROUP BY
  e.employeeId,
  soldMonth 
)

SELECT
  employeeId,
  lastName,
  firstName,
  SUM(
  CASE
    WHEN soldMonth = '01' THEN totalSales
    ELSE NULL END) 'JanSales',
  SUM(
  CASE
    WHEN soldMonth = '02' THEN totalSales
    ELSE NULL END) 'FebSales',
  SUM(
  CASE
    WHEN soldMonth = '03' THEN totalSales
    ELSE NULL END) 'MarSales',
  SUM(
  CASE
    WHEN soldMonth = '04' THEN totalSales
    ELSE NULL END) 'AprSales',
  SUM(
  CASE
    WHEN soldMonth = '05' THEN totalSales
    ELSE NULL END) 'MaySales',
  SUM(
  CASE
    WHEN soldMonth = '06' THEN totalSales
    ELSE NULL END) 'JunSales',
  SUM(
  CASE
    WHEN soldMonth = '07' THEN totalSales
    ELSE NULL END) 'JulSales',
  SUM(
  CASE
    WHEN soldMonth = '08' THEN totalSales
    ELSE NULL END) 'AugSales',
  SUM(
  CASE
    WHEN soldMonth = '09' THEN totalSales
    ELSE NULL END) 'SepSales',
  SUM(
  CASE
    WHEN soldMonth = '10' THEN totalSales
    ELSE NULL END) 'OctSales',
  SUM(
  CASE
    WHEN soldMonth = '11' THEN totalSales
    ELSE NULL END) 'NovSales',
  SUM(
  CASE
    WHEN soldMonth = '12' THEN totalSales
    ELSE NULL END) 'DecSales'
FROM CTE
GROUP BY
  employeeId,
  lastName,
  firstName
ORDER BY
  employeeId ASC;
SELECT
  e.employeeId,
  e.lastName,
  e.firstName,
  count(s.salesId) AS TotalCarsSold,
  min(s.salesAmount) LeastExpensiveCarSold,
  max(s.salesAmount) MostExpensiveCarSold
FROM employee e
INNER JOIN sales s
ON e.employeeId = s.employeeId
WHERE s.soldDate >= DATE('2023-01-01')
GROUP BY
  e.employeeId,
  e.lastName,
  e.firstName
HAVING TotalCarsSold > 5
ORDER BY TotalCarsSold DESC;
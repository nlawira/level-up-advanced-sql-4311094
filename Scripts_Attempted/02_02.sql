SELECT
  e.employeeId ID,
  e.lastName LastName,
  e.firstName FirstName,
  s.soldDate SoldDate,
  min(s.salesAmount) LeastExpensiveCarSold,
  max(s.salesAmount) MostExpensiveCarSold
FROM employee e
INNER JOIN sales s
ON e.employeeId = s.employeeId
WHERE
  s.soldDate >= DATE('2023-01-01')
GROUP BY
  e.employeeId,
  e.lastName,
  e.firstName
ORDER BY e.employeeId ASC;
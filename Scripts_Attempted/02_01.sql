SELECT
  e.employeeId,
  e.lastName||", "||e.firstName AS EmployeeName,
  count(s.salesId) AS TotalCarsSold
FROM employee e
INNER JOIN sales s
ON e.employeeId = s.employeeId
GROUP BY
  e.employeeId
ORDER BY TotalCarsSold DESC;
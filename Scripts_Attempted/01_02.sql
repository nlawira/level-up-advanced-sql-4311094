SELECT
  e.firstName||", "||e.lastName "Employee Name",
  e.title,
  e.startDate,
  s.salesId
FROM employee e
LEFT JOIN sales s
ON e.employeeId = s.employeeId
WHERE
  e.title = "Sales Person" AND
  s.salesAmount IS NULL;
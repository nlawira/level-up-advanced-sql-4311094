SELECT
  E.lastName||", "||E.firstName Employee,
  E.title as "Employee Title",
  M.firstName||", "||M.lastName Manager
FROM Employee E
LEFT OUTER JOIN Employee M
ON E.managerId = M.employeeId
ORDER BY E.employeeId DESC;

-- GO

-- SELECT
--   employeeId,
--   firstName,
--   lastName,
--   managerId
-- FROM Employee E;
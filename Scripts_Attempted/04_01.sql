SELECT
  e.lastName,
  e.firstName,
  m.model,
  count(m.model) AmountSold,
  RANK() OVER (
    PARTITION BY e.employeeId
    ORDER BY count(m.model) DESC
  ) SaleRank
FROM employee e
INNER JOIN sales s
ON e.employeeId = s.employeeId
INNER JOIN inventory i
ON s.inventoryId = i.inventoryId
INNER JOIN model m
ON m.modelId = i.modelId
WHERE e.title = "Sales Person"
GROUP BY
  e.lastName,
  e.firstName,
  m.model
ORDER BY
  e.lastName ASC,
  e.firstName ASC,
  AmountSold DESC,
  SaleRank DESC,
  m.model ASC;

-- GO

-- SELECT
--   e.lastName,
--   e.firstName,
--   m.model,
--   s.salesId
-- FROM employee e
-- INNER JOIN sales s
-- ON e.employeeId = s.employeeId
-- INNER JOIN inventory i
-- ON s.inventoryId = i.inventoryId
-- INNER JOIN model m
-- ON m.modelId = i.modelId
-- WHERE
--   e.title = "Sales Person" AND
--   lastName = "Barlow"
-- ORDER BY
--   e.lastName ASC,
--   e.firstName ASC;
-- Jess mentioned that FULL OUTER JOIN are not supported in SQLite, but it works fine in my query
-- Alternatively, use UNION in between statements

SELECT
  c.customerId,
  c.lastName||", "||c.firstName "Customer Name",
  s.salesId,
  s.salesAmount,
  s.soldDate
FROM customer c
FUll OUTER JOIN sales s
ON c.customerId = s.customerId
ORDER BY c.customerId;
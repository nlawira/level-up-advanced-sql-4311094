SELECT
  s.soldDate,
  s.salesAmount,
  sub.model,
  sub.colour,
  sub.year
FROM sales s
INNER JOIN (
  SELECT
    m.model,
    m.EngineType,
    i.inventoryId,
    i.colour,
    i.year
  FROM model m
  INNER JOIN inventory i
  ON m.modelId = i.modelId
  WHERE m.EngineType = 'Electric') sub
ON s.inventoryId = sub.inventoryId;
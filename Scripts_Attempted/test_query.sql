SELECT FirstName, LastName, Title
FROM Employee
LIMIT 5;

GO

SELECT Model, EngineType
FROM Model
LIMIT 5;

GO

SELECT sql
FROM sqlite_schema
WHERE name = 'employee';
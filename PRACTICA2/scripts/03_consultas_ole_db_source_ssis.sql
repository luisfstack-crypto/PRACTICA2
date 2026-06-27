/*
    Script: 03_consultas_ole_db_source_ssis.sql
    Descripción: Consultas utilizadas en los componentes OLE DB Source del paquete SSIS.
*/

-- Products
SELECT 
    p.ProductID,
    p.ProductName,
    c.CategoryName AS Category
FROM dbo.Products p
INNER JOIN dbo.Categories c
    ON p.CategoryID = c.CategoryID;

-- Customers
SELECT
    CustomerID,
    CompanyName,
    City,
    Country
FROM dbo.Customers;

-- Employees
SELECT
    EmployeeID,
    FirstName,
    LastName,
    ReportsTo AS Reports
FROM dbo.Employees;

-- Suppliers
SELECT
    SupplierID,
    CompanyName,
    Country
FROM dbo.Suppliers;

-- Time
SELECT DISTINCT
    CAST(OrderDate AS DATE) AS [Date],
    CAST(YEAR(OrderDate) AS INT) AS [Year],
    CAST(DATENAME(MONTH, OrderDate) AS VARCHAR(20)) AS [Month],
    CAST(DAY(OrderDate) AS INT) AS [Day]
FROM dbo.Orders
WHERE OrderDate IS NOT NULL;

-- Orders - Tabla de hechos
SELECT
    od.ProductID,
    o.CustomerID,
    o.EmployeeID,
    p.SupplierID,
    t.ID AS TimeID,
    CAST(od.UnitPrice AS FLOAT) AS Price,
    CAST(od.Quantity AS INT) AS Amount
FROM Northwind.dbo.[Order Details] od
INNER JOIN Northwind.dbo.Orders o
    ON od.OrderID = o.OrderID
INNER JOIN Northwind.dbo.Products p
    ON od.ProductID = p.ProductID
INNER JOIN DW_Northwind.dbo.[Time] t
    ON CAST(o.OrderDate AS DATE) = t.[Date]
WHERE 
    o.CustomerID IS NOT NULL
    AND o.EmployeeID IS NOT NULL
    AND p.SupplierID IS NOT NULL;

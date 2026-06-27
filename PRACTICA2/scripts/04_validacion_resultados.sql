/*
    Script: 04_validacion_resultados.sql
    Descripción: Consultas para validar la carga de datos en DW_Northwind.
*/

USE DW_Northwind;
GO

SELECT * FROM dbo.Products;
SELECT * FROM dbo.Customers;
SELECT * FROM dbo.Employees;
SELECT * FROM dbo.Suppliers;
SELECT * FROM dbo.[Time];
SELECT * FROM dbo.Orders;

SELECT 'Products' AS Tabla, COUNT(*) AS Total FROM dbo.Products
UNION ALL
SELECT 'Customers', COUNT(*) FROM dbo.Customers
UNION ALL
SELECT 'Employees', COUNT(*) FROM dbo.Employees
UNION ALL
SELECT 'Suppliers', COUNT(*) FROM dbo.Suppliers
UNION ALL
SELECT 'Time', COUNT(*) FROM dbo.[Time]
UNION ALL
SELECT 'Orders', COUNT(*) FROM dbo.Orders;

SELECT TOP 20
    p.ProductName,
    c.CompanyName AS Customer,
    e.FirstName + ' ' + e.LastName AS Employee,
    s.CompanyName AS Supplier,
    t.[Date],
    o.Price,
    o.Amount
FROM dbo.Orders o
INNER JOIN dbo.Products p
    ON o.ProductID = p.ProductID
INNER JOIN dbo.Customers c
    ON o.CustomerID = c.CustomerID
INNER JOIN dbo.Employees e
    ON o.EmployeeID = e.EmployeeID
INNER JOIN dbo.Suppliers s
    ON o.SupplierID = s.SupplierID
INNER JOIN dbo.[Time] t
    ON o.TimeID = t.ID;

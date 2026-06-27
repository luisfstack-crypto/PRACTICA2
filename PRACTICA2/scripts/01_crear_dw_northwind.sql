/*
    Script: 01_crear_dw_northwind.sql
    Descripción: Crea la base de datos DW_Northwind y las tablas del modelo estrella.
*/

IF DB_ID('DW_Northwind') IS NULL
BEGIN
    CREATE DATABASE DW_Northwind;
END
GO

USE DW_Northwind;
GO

IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;
IF OBJECT_ID('dbo.[Time]', 'U') IS NOT NULL DROP TABLE dbo.[Time];
IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL DROP TABLE dbo.Products;
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;
IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL DROP TABLE dbo.Employees;
IF OBJECT_ID('dbo.Suppliers', 'U') IS NOT NULL DROP TABLE dbo.Suppliers;
GO

CREATE TABLE dbo.Products (
    ProductID INT NOT NULL PRIMARY KEY,
    ProductName NVARCHAR(40) NOT NULL,
    Category NVARCHAR(40) NOT NULL
);

CREATE TABLE dbo.Customers (
    CustomerID NCHAR(5) NOT NULL PRIMARY KEY,
    CompanyName NVARCHAR(40) NOT NULL,
    City NVARCHAR(15) NULL,
    Country NVARCHAR(15) NULL
);

CREATE TABLE dbo.Employees (
    EmployeeID INT NOT NULL PRIMARY KEY,
    FirstName NVARCHAR(10) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Reports INT NULL
);

CREATE TABLE dbo.Suppliers (
    SupplierID INT NOT NULL PRIMARY KEY,
    CompanyName NVARCHAR(40) NOT NULL,
    Country NVARCHAR(15) NULL
);

CREATE TABLE dbo.[Time] (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Date] DATE NOT NULL UNIQUE,
    [Year] INT NOT NULL,
    [Month] VARCHAR(20) NOT NULL,
    [Day] INT NOT NULL
);

CREATE TABLE dbo.Orders (
    ProductID INT NOT NULL,
    CustomerID NCHAR(5) NOT NULL,
    EmployeeID INT NOT NULL,
    SupplierID INT NOT NULL,
    TimeID INT NOT NULL,
    Price FLOAT NOT NULL,
    Amount INT NOT NULL,

    CONSTRAINT FK_Orders_Products FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID),
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID),
    CONSTRAINT FK_Orders_Employees FOREIGN KEY (EmployeeID) REFERENCES dbo.Employees(EmployeeID),
    CONSTRAINT FK_Orders_Suppliers FOREIGN KEY (SupplierID) REFERENCES dbo.Suppliers(SupplierID),
    CONSTRAINT FK_Orders_Time FOREIGN KEY (TimeID) REFERENCES dbo.[Time](ID)
);
GO

/*
    Script: 02_limpiar_dw.sql
    Descripción: Limpia el Data Warehouse antes de ejecutar nuevamente el paquete ETL.
*/

USE DW_Northwind;
GO

DELETE FROM dbo.Orders;
DELETE FROM dbo.[Time];
DELETE FROM dbo.Products;
DELETE FROM dbo.Customers;
DELETE FROM dbo.Employees;
DELETE FROM dbo.Suppliers;

DBCC CHECKIDENT ('dbo.Time', RESEED, 0);
GO

IF DB_ID('AdventureWorks2012') IS NULL
    CREATE DATABASE AdventureWorks2012;
GO
USE AdventureWorks2012;
GO
CREATE SCHEMA Person;
GO
CREATE SCHEMA Sales;
GO

CREATE TABLE Person.Person (
    BusinessEntityID int NOT NULL PRIMARY KEY,
    FirstName nvarchar(50) NOT NULL,
    MiddleName nvarchar(50) NULL,
    LastName nvarchar(50) NOT NULL
);
CREATE TABLE Person.EmailAddress (
    BusinessEntityID int NOT NULL,
    EmailAddress nvarchar(100) NOT NULL
);
CREATE TABLE Person.PersonPhone (
    BusinessEntityID int NOT NULL,
    PhoneNumber nvarchar(30) NOT NULL,
    PhoneNumberTypeID int NOT NULL
);
CREATE TABLE Person.PhoneNumberType (
    PhoneNumberTypeID int NOT NULL PRIMARY KEY,
    Name nvarchar(50) NOT NULL
);
CREATE TABLE Sales.Customer (
    CustomerID int NOT NULL PRIMARY KEY,
    PersonID int NULL
);
CREATE TABLE Sales.SalesOrderHeader (
    SalesOrderID int NOT NULL PRIMARY KEY,
    OrderDate datetime NOT NULL,
    CustomerID int NOT NULL,
    SubTotal money NOT NULL,
    TaxAmt money NOT NULL,
    Freight money NOT NULL,
    TotalDue money NOT NULL
);
CREATE TABLE Sales.SalesOrderDetail (
    SalesOrderDetailID int NOT NULL PRIMARY KEY,
    SalesOrderID int NOT NULL,
    ProductID int NOT NULL,
    OrderQty smallint NOT NULL,
    UnitPrice money NOT NULL,
    LineTotal money NOT NULL
);
GO

INSERT INTO Person.Person VALUES (1, 'Gustavo', NULL, 'Achong');
INSERT INTO Person.EmailAddress VALUES (1, 'gustavo@example.test');
INSERT INTO Person.PhoneNumberType VALUES (1, 'Cell');
INSERT INTO Person.PersonPhone VALUES (1, '555-0100', 1);
INSERT INTO Sales.Customer VALUES (100, 1);
INSERT INTO Sales.SalesOrderHeader
    (SalesOrderID, OrderDate, CustomerID, SubTotal, TaxAmt, Freight, TotalDue)
VALUES
    (50001, '2011-05-15', 100, 100.00, 8.00, 2.00, 110.00),
    (50002, '2011-06-15', 100, 200.00, 16.00, 4.00, 220.00);
INSERT INTO Sales.SalesOrderDetail
    (SalesOrderDetailID, SalesOrderID, ProductID, OrderQty, UnitPrice, LineTotal)
VALUES (1, 50001, 10, 2, 50.00, 100.00);
GO

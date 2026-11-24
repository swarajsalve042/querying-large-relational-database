/*
AdventureWorks2012 - SQL Server Analysis Project
Author: Swaraj Salve
Purpose: Analyze the real AdventureWorks2012 sample data using its verified 2005-2008 sales date range.

Database: AdventureWorks2012
Recommended SQL Server / SSMS environment.
*/

USE AdventureWorks2012;
GO

/* 1. Person details: email, phone and phone number type */
SELECT
    p.BusinessEntityID,
    p.FirstName,
    p.MiddleName,
    p.LastName,
    e.EmailAddress,
    ph.PhoneNumber,
    pnt.Name AS PhoneNumberType
FROM Person.Person AS p
LEFT JOIN Person.EmailAddress AS e
    ON p.BusinessEntityID = e.BusinessEntityID
LEFT JOIN Person.PersonPhone AS ph
    ON p.BusinessEntityID = ph.BusinessEntityID
LEFT JOIN Person.PhoneNumberType AS pnt
    ON ph.PhoneNumberTypeID = pnt.PhoneNumberTypeID
ORDER BY p.LastName, p.FirstName;
GO

/* 2. Sales orders made in July 2005 (first month in this sample database) */
SELECT
    SalesOrderID,
    OrderDate,
    CustomerID,
    SubTotal,
    TaxAmt,
    Freight,
    TotalDue
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2005-07-01'
  AND OrderDate <  '2005-08-01'
ORDER BY OrderDate, SalesOrderID;
GO

/* 3. Sales details/orders for July 2005 */
SELECT
    soh.SalesOrderID,
    soh.OrderDate,
    soh.CustomerID,
    sod.SalesOrderDetailID,
    sod.ProductID,
    sod.OrderQty,
    sod.UnitPrice,
    sod.LineTotal
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
WHERE soh.OrderDate >= '2005-07-01'
  AND soh.OrderDate <  '2005-08-01'
ORDER BY soh.OrderDate, soh.SalesOrderID, sod.SalesOrderDetailID;
GO

/* 4. Total sales made in July 2005 */
SELECT
    SUM(TotalDue) AS TotalSales_July2005
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2005-07-01'
  AND OrderDate <  '2005-08-01';
GO

/* 5. Total sales in 2006 by month, ordered by increasing sales */
WITH MonthlySales AS (
    SELECT
        MONTH(OrderDate) AS SalesMonth,
        SUM(TotalDue) AS MonthlySales
    FROM Sales.SalesOrderHeader
    WHERE OrderDate >= '2006-01-01'
      AND OrderDate <  '2007-01-01'
    GROUP BY MONTH(OrderDate)
)
SELECT
    SalesMonth,
    MonthlySales
FROM MonthlySales
ORDER BY MonthlySales ASC;
GO

/* 6. Month-on-month sales change for 2006 */
WITH MonthlySales AS (
    SELECT
        DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1) AS MonthStart,
        SUM(TotalDue) AS MonthlySales
    FROM Sales.SalesOrderHeader
    WHERE OrderDate >= '2006-01-01'
      AND OrderDate <  '2007-01-01'
    GROUP BY DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1)
)
SELECT
    MonthStart,
    MonthlySales,
    LAG(MonthlySales) OVER (ORDER BY MonthStart) AS PreviousMonthSales,
    MonthlySales
        - LAG(MonthlySales) OVER (ORDER BY MonthStart) AS MoMChange
FROM MonthlySales
ORDER BY MonthStart;
GO

/* 7. Total sales for Gustavo Achong */
SELECT
    p.FirstName,
    p.LastName,
    c.CustomerID,
    SUM(soh.TotalDue) AS TotalSales
FROM Person.Person AS p
INNER JOIN Sales.Customer AS c
    ON p.BusinessEntityID = c.PersonID
INNER JOIN Sales.SalesOrderHeader AS soh
    ON c.CustomerID = soh.CustomerID
WHERE p.FirstName = 'Gustavo'
  AND p.LastName = 'Achong'
GROUP BY
    p.FirstName,
    p.LastName,
    c.CustomerID;
GO

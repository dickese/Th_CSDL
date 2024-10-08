use northwind
--1
go
select o.OrderID, o.OrderDate, c.CustomerID, e.EmployeeID, p.ProductID, od.Quantity, od.UnitPrice, od.Discount
from
[dbo].[Orders] o
join 
[dbo].[Customers] c on o.CustomerID = c.CustomerID
join 
[dbo].[Employees] e on o.EmployeeID = e.EmployeeID
join 
[dbo].[Order Details] od on o.OrderID = od.OrderID
join [dbo].[Products] p on od.ProductID = p.ProductID
where o.OrderID = '10248'
go

--2
 go
 select c.CustomerID, c.CompanyName, c.Address, o.OrderID, o.OrderDate
 from
 Customers c
 join
[dbo].[Orders] o on o.CustomerID = c.CustomerID
where month(o.OrderDate) in (7,9) and year(o.OrderDate) = 1997
go

--3
select p.ProductID, p.ProductName, o.OrderID, o.OrderDate, od.Quantity from Products p 
join [Order Details] od on od.ProductID= p.ProductID
join Orders o on od.OrderID = o.OrderID
where year(o.OrderDate) = 1996 and month(o.OrderDate) = 7 and day(o.OrderDate) = 19
go
--4
SELECT 
    p.ProductID, 
    p.ProductName, 
    s.SupplierID, 
    o.OrderID, 
    od.Quantity
FROM 
    [dbo].[Products] p
JOIN 
    [dbo].[Suppliers] s ON p.SupplierID = s.SupplierID
JOIN 
    [dbo].[Order Details] od ON p.ProductID = od.ProductID
JOIN 
    [dbo].[Orders] o ON od.OrderID = o.OrderID
WHERE 
    s.SupplierID IN (1, 3, 6) 
    AND YEAR(o.OrderDate) = 1997 and month(o.OrderDate) in (4,5,6)
--5
select * from Products p where p.UnitPrice = p.UnitsInStock


--6
 select p.ProductID, p.ProductName, o.OrderID, o.OrderDate, o.CustomerID, od.UnitPrice, od.Quantity, od.Quantity * od.UnitPrice 'Total' from 
 Products p 
 join [Order Details] od on od.ProductID = p.ProductID
 join Orders o on o.OrderID = od.OrderID
 where DATEPART(weekday, o.OrderDate) in (7,1) and month(o.OrderDate) = 12 and year(o.OrderDate) = 1996

--7
 go
 select e.EmployeeID, e.FirstName + e.LastName as 'Name', o.OrderID, o.OrderDate from Employees e, Orders o where  o.EmployeeID = e.EmployeeID
select e.EmployeeID, e.FirstName + e.LastName as 'Name', o.OrderID, o.OrderDate  from Employees e
join Orders o on  e.EmployeeID = o.EmployeeID
where month(o.OrderDate) = 7 and year(o.OrderDate) = 1996


--8
select  o.OrderID, o.OrderDate, od.ProductID, od.Quantity, od.UnitPrice from  Orders o
 join [Order Details] od on o.OrderID = od.OrderID
 join Employees e on o.EmployeeID = e.EmployeeID
 where e.LastName like '%Fuller%'

 --9
 select e.EmployeeID, e.FirstName + ' ' + e.LastName  'Name', o.OrderID, o.OrderDate, od.ProductID, od.Quantity, od.UnitPrice, od.Quantity* od.UnitPrice as 'Total' from Employees e 
 join Orders o on o.EmployeeID = e.EmployeeID
 join [Order Details] od on o.OrderID = od.OrderID
 where year(o.OrderDate) = 1996

 --10
 select * from Orders o where DATEPART(weekday, o.RequiredDate) = 7 and year(o.RequiredDate) = 1996 and month(o.RequiredDate) = 12

 --11

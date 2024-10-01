use Northwind
--1
go
Select Orders.OrderID, Orders.OrderDate, Orders.CustomerID, Orders.EmployeeID, [Order Details].ProductID,[Order Details].Quantity, [Order Details].UnitPrice, [Order Details].Discount from [dbo].[Order Details],[dbo].[Orders]  where [dbo].[Orders].OrderID = '10248'
--2
go
select [Orders].[CustomerID],[CompanyName],[Address] ,[OrderID], [OrderDate] from [dbo].[Customers], [dbo].[Orders] where Month([OrderDate]) in (7,9) and year([OrderDate]) = 1997 order by [OrderDate] desc
--3
go
select [dbo].[Products].[ProductID],[ProductName],[dbo].[Order Details].[OrderID],[OrderDate] ,[Quantity] from Products,[dbo].[Orders],[dbo].[Order Details] where year([OrderDate]) = 1996 and month([OrderDate]) = 7 and day([OrderDate]) = 19 
--4
 go
 select [dbo].[Products].ProductID, ProductName, [dbo].[Suppliers].SupplierID, [dbo].[Orders].OrderID, Quantity 
 from [dbo].[Products],[dbo].[Suppliers],[dbo].[Order Details], [dbo].[Orders] 
 where [dbo].[Suppliers].[SupplierID] in (1,3,6) and year([OrderDate]) = 1997 and month([OrderDate]) in (4,5,6)
 order by [SupplierID],[ProductID]
 --5
 go
 select * from Products where [UnitPrice] = [UnitsOnOrder]

--6
go
select [dbo].[Products].[ProductID],[ProductName],[dbo].[Order Details].[OrderID],[OrderDate],[CustomerID],[dbo].[Order Details].[UnitPrice],[Quantity] , [Quantity]* [dbo].[Order Details].[UnitPrice] as 'Total' from [dbo].[Order Details],[dbo].[Orders],[dbo].[Products] 
where DATEPART(w,[OrderDate]) in (1,7) and month([OrderDate]) =12 and year([OrderDate]) = 1996
order by [Products].ProductID, [Quantity] desc

--7
go
 select [dbo].[Employees].[EmployeeID], [LastName] + [FirstName] as EmployeeName from [dbo].[Employees],[dbo].[Orders] where month([OrderDate]) = 7 and year([OrderDate])=1996
 group by [dbo].[Employees].[EmployeeID]
--8
go
select Orders.OrderID, Orders.OrderDate,ProductID, [Quantity] ,[UnitPrice] 
from [dbo].[Orders],[dbo].[Order Details], [dbo].[Employees] where [LastName] like '%Fuller%' 

--9
go
 select Employees.EmployeeID,[LastName]+[FirstName] as EmployeeName ,
 [dbo].[Order Details].[OrderID] ,[dbo].[Orders].[OrderDate], [dbo].[Products].ProductID, [Quantity],[dbo].[Order Details].[UnitPrice],[Quantity]*[dbo].[Order Details].[UnitPrice] as 'TotalLine'
 from [dbo].[Orders],[dbo].[Order Details], [dbo].[Employees], [dbo].[Products] where year([OrderDate]) =1996

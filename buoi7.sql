use Northwind

--1
select o.OrderID, o.OrderDate, sum(od.Quantity * od.UnitPrice) as Total
from Orders o, [dbo].[Order Details] od
where o.OrderID = od.OrderID
group by o.OrderID , o.OrderDate
order by o.OrderID


--2
select  o.OrderID , o.OrderDate, sum((od.UnitPrice - od.Discount) * od.Quantity) as Total
from Orders o ,[Order Details] od
where o.OrderID = od.OrderID and o.ShipCity like 'Madrid'
group by o.OrderID , o.OrderDate
order by o.OrderID

--3

select year(o.OrderDate) Year, count(o.OrderID) as CountOfOrders
from [dbo].[Orders] o 
group by  year(o.OrderDate)
order by Year

select year(o.OrderDate) as Year, month(o.OrderDate) as Month, count(o.OrderID)
from [dbo].[Orders] o 
group by  year(o.OrderDate), month(o.OrderDate)
order by Year, Month


select year(o.OrderDate) as Year, month(o.OrderDate) as Month, e.EmployeeID, count(o.OrderID) as CountOfOrder
from [dbo].[Employees] e, [dbo].[Orders] o 
where e.EmployeeID = o.EmployeeID
group by  year(o.OrderDate) , month(o.OrderDate), e.EmployeeID
order by Year, Month, e.EmployeeID


--4
select e.EmployeeID , e.FirstName +' '+e.LastName as EmployeeName, count(o.OrderID) as  'CountOfOrder'
from [dbo].[Employees] e, [dbo].[Orders] o
where e.EmployeeID = o.EmployeeID
group by  e.EmployeeID , e.FirstName +' '+e.LastName

--5
select e.EmployeeID , e.FirstName + ' ' + e.LastName as EmployeeName, count(o.OrderID) as CountOfOrder, sum(od.Quantity * od.UnitPrice) as Total
from [dbo].[Employees] e, [dbo].[Orders] o, [dbo].[Order Details] od
where e.EmployeeID = o.EmployeeID and od.OrderID = o.OrderID
group by e.EmployeeID , e.FirstName + ' ' + e.LastName 
order by e.EmployeeID


--6
select e.EmployeeID , e.FirstName + ' '+e.LastName as EmployeeName, Month(o.OrderDate) as Month_Salary, sum(od.Quantity * od.UnitPrice) * 0.1 as Salary
from [dbo].[Employees] e, [dbo].[Order Details] od, [dbo].[Orders] o
where e.EmployeeID = o.EmployeeID and o.OrderID = od.OrderID and year(o.OrderDate)= 1996
group by e.EmployeeID , e.FirstName + ' '+e.LastName , Month(o.OrderDate)
order by Month_Salary ,Salary desc

--7
select e.EmployeeID, e.FirstName +' '+e.LastName as EmployeeName, count(o.OrderID) as CountOfOrder, sum(od.Quantity * od.UnitPrice) as Total
from [dbo].[Employees] e, [dbo].[Orders] o, [dbo].[Order Details] od
where e.EmployeeID = o.EmployeeID and od.OrderID = o.OrderID and month(o.OrderDate) = 3 and year(o.OrderDate) = 1997
group by e.EmployeeID, e.FirstName +' '+e.LastName 
having  sum(od.Quantity * od.UnitPrice) > 4000
order by e.EmployeeID

--8
select 
from 





--14
select top 3 c.CustomerID , c.ContactName, count(o.OrderID) as CountOfOrder
from [dbo].[Customers] c, [dbo].[Orders] o
where c.CustomerID = o.CustomerID and year(o.OrderDate) = 1996
group by c.CustomerID , c.ContactName
order by CountOfOrder desc
--15
select p.ProductID , p.ProductName , count(o.OrderID) as CountOfOrder
from [dbo].[Products] p , [dbo].[Orders] o ,[dbo].[Order Details] od
where o.OrderID = od.OrderID and p.ProductID = od.ProductID
group by  p.ProductID , p.ProductName 
order by CountOfOrder desc



select *
from [dbo].[Products] p where p.UnitPrice > (select avg(p.UnitPrice) from Products p)


select *
from [dbo].[Products] p where p.UnitPrice > (select min(p.UnitPrice) from Products p)

select 
from [dbo].[Orders] o,[dbo].[Products] p ,[dbo].[Order Details] od
where o.OrderID = od.OrderID and p.ProductID = od.ProductID and o()
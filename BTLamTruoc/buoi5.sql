use Northwind
go
--1.Liệt kê danh sách tất cả các mặt hàng (Products).
select * from Products
go
--2.Liệt kê danh sách tất cả các mặt hàng (Products). Thông tin bao gồm ProductID, ProductName, UnitPrice.
select ProductID, ProductName,UnitPrice from Products
go
--3.Liệt kê danh sách các nhân viên (Employees). Thông tin bao gồm EmployeeID, EmployeeName,
--Phone, Age. Trong đó EmployeeName được ghép từ LastName và FirstName; Age là tuổi được tính dựa 
--trên năm hiện hành (GetDate()) và năm sinh.
select EmployeeID, Employees.LastName + ' '+ Employees.FirstName as 'EmployeeName' , Employees.HomePhone, year(getdate()) - year(Employees.BirthDate) as 'Age'from Employees
go
select CustomerID, CompanyName, ContactName, ContactTitle,City, Phone from Customers where Customers.ContactTitle like 'O%'
go
select * from Customers where Customers.City in ('LonDon', 'Boise', 'Paris')
go
select * from Customers where Customers.ContactName like 'V%' and Customers.City = 'Lyon'
go 
select * from Customers where Customers.Fax is NULL
go 
select * from Customers where Customers.Fax is not null
go
select * from Employees where year(Employees.BirthDate) <= 1960
go
select * from Products where Products.QuantityPerUnit like '%Boxes%'
go
 select * from Products where Products.UnitPrice between 10 and 15
go 
select * from Products where Products.UnitsInStock < 5
go
--13.	Liệt kê danh sách các mặt hàng (Products) ứng với tiền tồn vốn. Thông tin bao gồm ProductId, ProductName, Unitprice, UnitsInStock, Total. Trong đó Total= UnitsInStock*Unitprice. Được sắp xếp theo Total giảm dần.
select ProductId, ProductName, Unitprice, UnitsInStock, UnitsInStock * UnitPrice as Total from Products order by Total DESC
--14.Hiển thị thông tin OrderID, OrderDate, CustomerID, EmployeeID của 2 hóa đơn có mã OrderID là ‘10248’ và ‘10250’
select OrderID, OrderDate, CustomerID, EmployeeID  from Orders where OrderID in ('10248', '10250')
go 
--15.	Liệt kê chi tiết của hóa đơn có OrderID là ‘10248’. Thông tin gồm OrderID, ProductID, Quantity, Unitprice, Discount, ToTalLine = Quantity * unitPrice *(1-Discount) 
select OrderID, ProductID, Quantity, Unitprice, Discount, ToTalLine = Quantity * unitPrice *(1-Discount) from [Order Details]where OrderID = '10248'
go
 --16.	Liệt kê danh sách các hóa đơn (orders) có OrderDate được lập trong tháng 9 năm 1996. Được sắp xếp theo mã khách hàng, cùng mã khách hàng sắp xếp theo ngày lập hóa đơn giảm dần.

 select * from Orders where month(Orders.OrderDate) = 9 and  year(Orders.OrderDate) = 1996 order by Orders.CustomerID Asc, Orders.OrderDate DESC

 --17.	Liệt kê danh sách các hóa đơn (Orders) được lập trong quý 4 năm 1997. Thông tin gồm OrderID, OrderDate, CustomerID, EmployeeID. Được sắp xếp theo tháng của ngày lập hóa đơn.
 select OrderID, OrderDate, CustomerID, EmployeeID from Orders where year(Orders.OrderDate) = '1997' and MONTH(orders.OrderDate) > 9
 go
 --18.	Liệt kê danh sách các hóa đơn (Orders) được lập trong trong ngày thứ 7 và chủ nhật của tháng 12 năm 1997. Thông tin gồm OrderID, OrderDate, Customerid, EmployeeID, WeekDayOfOrdate (Ngày thứ mấy trong tuần). 
 go
SELECT 
    OrderID, 
    OrderDate, 
    CustomerID, 
    EmployeeID,
    DATENAME(WEEKDAY, OrderDate) AS WeekDayOfOrdate
FROM 
    Orders
WHERE 
    YEAR(OrderDate) = 1997 
    AND MONTH(OrderDate) = 12 
    AND DATEPART(WEEKDAY, OrderDate) IN (1, 7) -- 1 là Chủ nhật và 7 là Thứ bảy
ORDER BY 
    OrderDate;
go 
select * from Customers
--19.	Liệt kê danh sách 5 customers có city có ký tự bắt đầu  ‘M’.
select * from Customers where Customers.ContactName like 'M%'

--20.	Liệt kê danh sách 2 employees có tuổi lớn nhất. Thông tin bao gồm EmployeeID, EmployeeName, Age. Trong đó, EmployeeName được ghép từ LastName và FirstName; Age là tuổi.
go
select top 2 EmployeeID,Employees.LastName + ' ' + Employees.FirstName as  EmployeeName, year(getdate())  - year(Employees.BirthDate) Age from Employees 

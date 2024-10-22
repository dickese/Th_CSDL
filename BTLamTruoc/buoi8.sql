use Northwind

--1.Liệt kê các product có đơn giá mua lớn hơn đơn giá mua trung bình của
--tất cả các product.

select * from [dbo].[Products]  p where p.[UnitPrice] > (select avg([UnitPrice]) from [dbo].[Products])

--2. Liệt kê các product có đơn giá mua lớn hơn đơn giá mua nhỏ nhất của tất
--cả các product.

select * from [dbo].[Products]  p where p.[UnitPrice] > (select min([UnitPrice]) from [dbo].[Products])


--3. Liệt kê các product có đơn giá bán lớn hơn đơn giá bán trung bình của
--các product. Thông tin gồm ProductID, ProductName, OrderID,Orderdate, Unitprice .


select od.ProductID, p.ProductName, od.OrderID, o.Orderdate, od.Unitprice 
from [dbo].[Order Details] od , [dbo].[Products] p, [dbo].[Orders] o  
where p.[ProductID] = od.[ProductID] and od.[OrderID] = o.[OrderID] 
and od.[UnitPrice] > (select avg([UnitPrice]) from [dbo].[Order Details])



--4. Liệt kê các product có đơn giá bán lớn hơn đơn giá bán trung bình của
--các product có ProductName bắt đầu là 'N'.

select *
from [dbo].[Order Details] od, Products p 
where od.[UnitPrice] > (select avg(od.[UnitPrice]) from [dbo].[Order Details] od) and p.ProductName like 'N%'

select * 
from [dbo].[Order Details] od
join [dbo].[Products] p on p.ProductID = od.ProductID
where od.UnitPrice > (select avg(od.UnitPrice) 
                      from [dbo].[Order Details] od
                      join [dbo].[Products] p on p.ProductID = od.ProductID
                      where p.ProductName like 'N%')
--5. Cho biết những sản phẩm có tên bắt đầu bằng 'T' và có đơn giá bán lớn
--hơn đơn giá bán của (tất cả) những sản phẩm có tên bắt đầu bằng chữ'V'.

select *
from [dbo].[Order Details] od, [dbo].[Products] p
where p.ProductName like 'T%' and od.ProductID = p.ProductID
and  od.[UnitPrice] > (select max(od.[UnitPrice]) from [dbo].[Order Details]  od, [dbo].[Products] p where p.[ProductName] like 'V%')

select * from [dbo].[Products]

--6. Cho biết sản phẩm nào có đơn giá bán cao nhất trong số những sản phẩm
--có đơn vị tính có chứa chữ 'box'.


select distinct(od.ProductID), p.ProductName
from [Order Details] od, Products p 
where od.ProductID = p.ProductID and od.UnitPrice = (select max(p.[UnitPrice]) from [dbo].[Products] p where p.QuantityPerUnit like '%box%')


select p.ProductID, p.ProductName
from Products p
where p.QuantityPerUnit like '%box%'
and p.UnitPrice = (select max(UnitPrice) from Products where QuantityPerUnit like '%box%')

--7. Liệt kê các product có tổng số lượng bán (Quantity) trong năm 1998 lớn
--hơn tổng số lượng bán trong năm 1998 của mặt hàng có mã 71


select  od.ProductID, SUM(od.Quantity) AS TotalQuantity
from [Order Details] od, Orders o 
where od.OrderID = o.OrderID and year(o.OrderDate) = 1998
group by od.ProductID
having sum(od.Quantity) > (
select sum(od.Quantity)
from [Order Details] od, Orders o 
where od.OrderID = o.OrderID and year(o.OrderDate) = 1998 and od.ProductID = 71
) 

--8. Thực hiện :
--- Thống kê tổng số lượng bán ứng với mỗi mặt hàng thuộc nhóm
--hàng có CategoryID là 4. Thông tin : ProductID, QuantityTotal
--(tập A)

select p.[ProductID], sum(od.[Quantity]) as QuantityTotal from [dbo].[Products]p , [dbo].[Order Details] od where [CategoryID] = 4 and od.[ProductID] = p.[ProductID]
group by p.[ProductID]

--- Thống kê tổng số lượng bán ứng với mỗi mặt hàng thuộc nhóm
--hàng khác 4. Thông tin : ProductID, QuantityTotal (tập B)

select p.[ProductID], p.[CategoryID], sum(od.[Quantity]) as QuantityTotal from [dbo].[Products]p , [dbo].[Order Details] od where  [CategoryID] != 4 and od.[ProductID] = p.[ProductID]
group by p.[ProductID], p.[CategoryID]


--- Dựa vào 2 truy vấn trên : Liệt kê danh sách các mặt hàng trong
--tập A có Quantity Total lớn hơn tất cả QuantityTotal của tập B

select p.[ProductID], sum(od.[Quantity]) as QuantityTotal from [dbo].[Products]p , [dbo].[Order Details] od 
where [CategoryID] = 4 and od.[ProductID] = p.[ProductID]
group by p.[ProductID]
having sum(od.[Quantity]) > all (select sum(od.[Quantity])from [dbo].[Products]p , [dbo].[Order Details] od where  not [CategoryID] = 4 and od.[ProductID] = p.[ProductID]
group by p.[ProductID], p.[CategoryID]
)

--9. Danh sách các Product có tổng số lượng bán được lớn nhất trong năm
--1998

select top 1 p.[ProductID], sum(od.[Quantity]) as QuantityTotal from [dbo].[Products] p , [dbo].[Order Details] od,[dbo].[Orders] o  where od.[ProductID] = p.[ProductID] and year([OrderDate]) = 1998 and o.[OrderID] = od.[OrderID]
group by p.[ProductID] 
order by sum(od.[Quantity]) desc

--10. Danh sách các products đã có khách hàng mua hàng (tức là ProductID có
--trong [Order Details]). Thông tin bao gồm ProductID, ProductName,
--Unitprice


select distinct(p.[ProductID]), p.[ProductName], od.[UnitPrice]
from [Order Details] od , Products p 
where od.[ProductID] = p.[ProductID]


--11. Danh sách các hóa đơn của những khách hàng ở thành phố LonDon và
--Madrid.
select * from Orders o, Customers c
where c.[CustomerID] = o.[CustomerID] and c.[City] in( 'LonDon', 'Madrid')


--12. Liệt kê các sản phẩm có trên 20 đơn hàng trong quí 3 năm 1998, thông
--tin gồm ProductID, ProductName.
select p.[ProductID], p.[ProductName], sum(od.[Quantity])
from [dbo].[Order Details] od , [dbo].[Orders] o , [dbo].[Products] p 
where year(o.[OrderDate]) = 1998 and month(o.[OrderDate]) in (7,8,9) and od.[OrderID]= o.[OrderID] and p.[ProductID] = od.[ProductID]
group by p.[ProductID], p.[ProductName]
having sum(od.[Quantity]) > 20
--13. Liệt kê danh sách các sản phẩm chưa bán được trong tháng 6 năm 1996

select p.[ProductID], p.[ProductName]
from  [dbo].[Products] p 
where p.[ProductID] not in (select DISTINCT od.[ProductID] from  [Order Details] od , Orders o 
where od.[OrderID] = o.[OrderID] and  year(o.[OrderDate]) = 1998 and month(o.[OrderDate]) = 6)


--14. Liệt kê danh sách các Employes không lập hóa đơn vào ngày hôm nay
select * from Customers where CustomerID not in (select CustomerID from Orders o 
where o.OrderDate = getdate())

--15. Liệt kê danh sách các Customers chưa mua hàng trong năm 1997
select CustomerID from Customers c where c.CustomerID not in (select CustomerID from Orders o where year(o.OrderDate) =1997)

--16. Tìm tất cả các Customers mua các sản phẩm có tên bắt đầu bằng chữ T
--trong tháng 7 năm 1997

select distinct(c.CustomerID)
from Orders c, [Order Details] od where c.OrderID = od.OrderID and od.ProductID in (select p.ProductID
from Products p 
where p.ProductName like 'T%') and year(c.OrderDate) =1997 and month(c.OrderDate) = 7

-- Khách hàng mua hóa đơn chỉ có những sản phẩm lớn hơn 3

select Distinct(o.CustomerID) from [Order Details] od, Orders o where od.OrderID = o.OrderID and od.ProductID in (select p .ProductID from Products p where p.ProductID >= 3)


--18. Tim cac Customer chua tung lap hoa don 

select * from Customers c where c.CustomerID not in(select distinct(o.CustomerID) from Orders o)

select * from Customers c 
left join Orders o on o.CustomerID = c.CustomerID
where o.CustomerID is NULL

select c.CustomerID from Customers c where not exists (select 1 from Orders o where c.CustomerID = o.CustomerID)

--19. Bạn hãy mô tả kết quả của các câu truy vấn sau ?
--Select ProductID, ProductName, UnitPrice From [Products]
--Where Unitprice>ALL (Select Unitprice from [Products] where
--ProductName like 'N%')

--Sản phẩm có giá mua lớn hơn giá mua của tất cả các sản phẩm nào có tên bắt đầu bằng 'N'

Select ProductId, ProductName, UnitPrice From [Products]
Where Unitprice>ANY (Select Unitprice from [Products] where
ProductName like 'N%')

--Sản phẩm có giá mua lớn hơn giá mua của bất kì 1 sản phẩm nào có tên bắt đầu bằng 'N'

Select ProductId, ProductName, UnitPrice from [Products]
Where Unitprice=ANY (Select Unitprice from [Products] where
ProductName like 'N%')

--Sản phẩm có giá mua bằng giá mua của bất kì các sản phẩm nào có tên bắt đầu bằng 'N'

Select ProductId, ProductName, UnitPrice from [Products]
Where ProductName like 'N%' and
Unitprice>=ALL (Select Unitprice from [Products] where
ProductName like 'N%')

--Sản phẩm có giá mua lớn hơn hoặc bằng giá mua của tất cả các sản phẩm nào có tên bắt đầu bằng 'N'
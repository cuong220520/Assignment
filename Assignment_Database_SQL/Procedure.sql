--Signin Proc
create proc usp_Signin
	@User varchar(20),
	@Password varchar(20)
as
begin
	select AccountID, FirstName, LastName, BirthDate, AddressID from Customer where AccountID in (select ID from Accounts where [User] = @User and [Password] = @Password) 																			
end
go
exec usp_Signin 'William@gmail.com', '111111'

--Signup Proc
alter proc usp_Signup
	@User varchar(20),
	@Password varchar(20),
	@FirstName varchar(20),
	@LastName varchar(20),
	@BirthDate date,
	@Address int
as
begin
	declare @ID int
	while exists (select AccountID from Customer)
	begin
		set @ID = @ID + 1
	end
	insert into Accounts([ID], [User], [Password]) values (@ID, @User, @Password);
	insert into Customer(AccountID, FirstName, LastName, BirthDate, AddressID) values (@ID, @FirstName, @LastName, @BirthDate, @Address);
end
go
exec usp_Signup 'Anderson222@gmail.com', '123456','Filex','Anderson', '1990-05-25'
--Search Proc
alter proc usp_Search
	@Name varchar(50) = null
as 
begin
	select top(5) * from Product where [Name] like @Name
end
go
exec usp_Search 'Xperia 1'

--Search Brand Proc
alter proc usp_ASearch
	@Brand varchar(20) = null
as
begin
	select * from Product where BrandID in (select ID from BrandID where [Name] = @Brand)
end
go
exec usp_ASearch 'Apple'

--Search Type Proc
alter proc usp_TypeSearch
	@Type varchar(20) = null
as
begin
	select * from Product where TypeID in (select ID from [Type] where [Name] = @Type)
end
go
exec usp_TypeSearch 'Cellphone'
--Show best selling products
select [image], [Name], UnitPrice from Product where ID in (select top(6) ProductID from Detail order by Quantity desc);

--Add Products to Cart
alter proc usp_AddProducts
	@CustomerID int = null,
	@ProductID int = null,
	@EmplyeeID int = null,
	@Delivery int = null,
	@Quantity int = null
as
begin
	declare @OrderID int
	set @OrderID = 1
	while Exists (select ID from [Order] where ID = @OrderID)
	begin
		set @OrderID = @OrderID + 1
	end
	insert into [Order](ID, CustomerID, [Status]) values (@OrderID, @CustomerID, 0);
	insert into Detail(ProductID, OrderID, Delivery_FormID, Quantity) values (@ProductID, @OrderID, @Delivery, @Quantity);
end
go
exec usp_AddProducts 7, 7, 1003, 2, 1

--Add Payment Infor Proc
create proc usp_Payment
	@CardNumber varchar(50)
as
begin
	declare @TransferDate datetime = getdate();
	insert into Payment(CardNumber, PaymentMethod) values (@CardNumber, 'Card');
end

--Add Employee Proc
create proc usp_AddEmployee
	@FirstName varchar(20),
	@LastName varchar(20),
	@PhoneNumber varchar(20),
	@PositionID int,
	@Born char(4)
as
begin	
	declare @ID int;
	set @ID = 1001
	while Exists (select ID from Employee where ID = @ID)
	begin
		set @ID = @ID + 1 --create EmployeeID automatically
	end
	declare @User varchar(50) = cast(@ID as varchar) + '@gmail.com'; --create User automatically
	declare @Password varchar(20) = '123456'; --create Password automatically
	insert into Employee(ID, PositionID, FirstName, LastName, Born, PhoneNumber) values (@ID, @PositionID, @FirstName, @LastName, @Born, @PhoneNumber);
	insert into Accounts(ID, [User], [Password]) values (@ID, @User, @Password);
end
go
exec usp_AddEmployee 'Edward', 'Newgate', '121244324', '993', '1988'

--Update Employee Infor Proc
create proc usp_UpdateEmployee
	@EmployeeID int,
	@FirstName varchar(20),
	@LastName varchar(20),
	@PhoneNumber varchar(20),
	@PositionID int,
	@Password varchar(20)
as
begin
	update Employee
	set FirstName = @FirstName, LastName = @LastName, PhoneNumber = @PhoneNumber, PositionID = @PositionID
	where ID = @EmployeeID
	update Accounts
	set [Password] = @Password 
	where ID = @EmployeeID
end
go
exec usp_UpdateEmployee 1009, 'Edward', 'Newgate', '121244324', '992', '22322142'

--Delete Employee Infor Proc
create proc usp_DeleteEmployee
	@EmployeeID int
as
begin
	delete Employee 
	where ID = @EmployeeID
	delete Accounts
	where ID = @EmployeeID
end
exec usp_DeleteEmployee 1009

--Add Customer Proc
alter proc usp_AddCustomer
	@FirstName varchar(20) = null,
	@LastName varchar(20) = null,
	@PhoneNumber varchar(20) = null,
	@BirthDate date = null,
	@Address int = null
as
begin	
	declare @UBirthDate varchar(20) = replace(Cast(@BirthDate as varchar(20)), '-', '')
	declare @ID int
	set @ID = 1
	while Exists (select ID from Accounts where ID = @ID)
	begin
		set @ID = @ID + 1 --create AccountID automatically
	end
	declare @User varchar(50) = @LastName + @UBirthDate + cast(@ID as varchar(20)); --create User automatically
	declare @Password varchar(20) = '123456'; --create Password automatically
	insert into Accounts(ID, [User], [Password]) values (@ID, @User, @Password);
	insert into Customer(AccountID, FirstName, LastName, BirthDate, AddressID) values (@ID, @FirstName, @LastName, @BirthDate, @Address);
end
go
exec usp_AddCustomer 'Jorg', 'Dash', '23200012', '1992-09-25', 3

--Update Customer proc
create proc usp_UpdateCustomer
	@CustomerID int,
	@FirstName varchar(20),
	@LastName varchar(20),
	@BirthDate date,
	@Password varchar(20)
as
begin
	update Customer 
	set FirstName = @FirstName, LastName = @LastName, BirthDate = @BirthDate
	where AccountID = @CustomerID
	update Accounts
	set [Password] = @Password
	where ID = @CustomerID
end
exec usp_UpdateCustomer 1, 'Andolf', 'Anderson','1992-10-22', '123456'

--Delete Customer Infor Proc
create proc usp_DeleteCustomer
	@CustomerID int
as
begin
	delete Customer 
	where AccountID = @CustomerID
	delete Accounts
	where ID = @CustomerID
end
go
exec usp_DeleteCustomer 3
-- Find Customer Infor by RegistrationDate
create proc usp_FindDate
	@RegistrationDate date
as
begin
	select * from Customer where AccountID in (select ID from Accounts where RegistrationDate = @RegistrationDate)
	select * from Accounts where RegistrationDate = @RegistrationDate	
end
go
exec usp_FindDate '2019-04-26'
--Find Customer Infor by Name, ID, User
create proc usp_FindID
	@FirstName varchar(20) = null,
	@LastName varchar(20) = null,
	@ID int = null,
	@User varchar(20) = null
as
begin
	select AccountID, FirstName, LastName, BirthDate, Accounts.[User], Accounts.[Password], Accounts.RegistrationDate 
	from Customer inner join Accounts on (AccountID) = Accounts.ID
	where AccountID = @ID or FirstName = @FirstName or LastName = @LastName or [User] = @User
end
go
exec usp_FindID 'William'
exec usp_FindID @ID = 3

--Find Employee Infor by Position
create proc usp_FindPosition
	@Position varchar(20) = null
as
begin
	select * from Employee left join Position on (PositionID) = Position.ID
	right join Accounts on (Employee.ID) = Accounts.ID
	where Position.[Name] = @Position
end	
go
exec usp_FindPosition 'Admin'

/*Employee.ID, Employee.FirstName, Employee.LastName, Employee.HireDate, Employee.PhoneNumber*/
/*select Employee.ID, FirstName, LastName, Born, PositionID, [User], [Password], HireDate, [Name], PhoneNumber from Employee
	inner join Position on (PositionID) = Position.ID
	inner join Accounts on Employee.ID = Accounts.ID
	where PositionID = @Position*/

--Find Employee Infor by ID, Name, User, PhoneNumber
create proc usp_FindEMID
	@ID int = null,
	@FirstName varchar(20) = null,
	@LastName varchar(20) = null,
	@User varchar(20) = null,
	@PhoneNumber varchar(20) = null
as
begin
	select Employee.ID, FirstName, LastName, Born, Accounts.[User], Accounts.[Password], Accounts.RegistrationDate, PhoneNumber
	from Employee inner join Accounts on Employee.ID = Accounts.ID
	where Employee.ID = @ID or FirstName = @FirstName or LastName = @LastName or [User] like @User or PhoneNumber like @PhoneNumber
end
go
exec usp_FindEMID @ID = 1006
--Update Current Stock of Products
alter trigger Check_CurrentStock
on Product_Supplier
instead of update
as
begin
	declare @ProductID int = (select ProductID from Product_Supplier)
	declare @Stock int = (select Stock from Product_Supplier)
	declare @ProductName varchar(50) = (select [Name] from Product)
	if(@Stock > 0) 
	update Product_Supplier
	set ProductID = @ProductID, Stock = @Stock
	else
	update Product_Supplier
	set ProductID = @ProductID, Stock = 0
end
--Add Products to the warehouse
alter proc usp_AddWH
	@ProductID int,
	@ProductName varchar(50),
	@SupplierID int,
	@ImportPrice money,
	@Stock int,
	@BrandID int,
	@TypeID int,
	@UnitPrice money 
as
begin	
	insert into Product(ID, [Name], UnitPrice, BrandID, TypeID) values (@ProductID, @ProductName, @UnitPrice, @BrandID, @TypeID)
	insert into Product_Supplier(ProductID, SupplierID, ImportPrice, Stock) values (@ProductID, @SupplierID, @ImportPrice, @Stock)
	declare @Date datetime = getdate()
end
go
exec usp_AddWH 1009, 'Bravia 4K', 112, 1399, 20, 1, 2, 1799
--Update Products Proc
alter proc usp_UpdatePRO
	@ProductID int = null,
	@ProductName varchar(50) = null,
	@SupplierID int = null,
	@ImportPrice money = null,
	@Stock int = null,
	@BrandID int = null,
	@TypeID int = null,
	@UnitPrice money = null 
as
begin
	/*update Product_Supplier
	set SupplierID = @SupplierID, Stock = @Stock, ImportPrice = @ImportPrice*/
	update Product
	set [Name] = @ProductName, BrandID = @BrandID, TypeID = @TypeID, UnitPrice = @UnitPrice
	where ID = @ProductID
end
exec usp_UpdatePRO 1009, 'Bravia 4K', 112, 1299, 20, 1, 2, 1799
--create Search Products by Type
create proc usp_SearchType
	@Type varchar(20) = null
as
begin
	select Product.ID, Product.[Name], UnitPrice, BrandID.[Name], [Type].[Name], [Year], [Image]
	from Product
	inner join [Type] on (TypeID) = [Type].ID
	inner join BrandID on (BrandID) = BrandID.ID
	where [Type].[Name] = @Type
end
go
exec usp_SearchType 'Cellphone'

--create Search Products by Brand
create proc usp_SearchBrand
	@Brand varchar(20) = null
as
begin
	select Product.ID, Product.[Name], UnitPrice, BrandID.[Name], [Type].[Name], [Year], [Image]
	from Product
	inner join [Type] on (TypeID) = [Type].ID
	inner join BrandID on (BrandID) = BrandID.ID
	where BrandID.[Name] = @Brand
end

--Search Products by ID, Name, year proc
create proc usp_SearchProduct
	@ID int = null,
	@Name varchar(50) = null,
	@Year char(4) = null
as
begin
	select Product.ID, Product.[Name], UnitPrice, BrandID.[Name], [Type].[Name], [Year], [Image]
	from Product
	inner join [Type] on (TypeID) = [Type].ID
	inner join BrandID on (BrandID) = BrandID.ID
	where Product.ID = @ID or Product.[Name] like @Name or Product.[Year] = @Year
end

--Delete Products proc
create proc usp_DeleteProduct
	@ID int
as
begin
	delete Product where ID = @ID
	delete Product_Supplier where ProductID = @ID
end
go
exec usp_DeleteProduct 109
--Search Order based on OrderDate proc
alter proc usp_SearchDate
	@OrderDate date
as
begin
	select * from [Order] where OrderDate = @OrderDate
end
go
exec usp_SearchDate '2019-04-26'
--Search Order based on ID, CustomerID, EmployeeID, StatusID proc
create proc usp_SearchOrderID
	@ID int = null,
	@CustomerID int = null,
	@EmployeeID int = null,
	@StatusID int = null
as
begin
	select * from [Order] 
	where [Order].ID = @ID or CustomerID = @CustomerID or EmployeeID = @EmployeeID or [Status] = @StatusID
	select * from [Status]
	select * from Employee
end
exec usp_SearchOrderID @ID = 3

--Update Order proc
alter proc usp_UpdateOrder
	@OrderID int = null,
	@CustomerID int = null,
	@EmployeeID int = null,
	@StatusID int = null
as
begin
	declare @UpdateDate date = getdate()
	update [Order]
	set CustomerID = @CustomerID, EmployeeID = @EmployeeID, [Status] = @StatusID
	where ID = @OrderID
end
go
exec usp_UpdateOrder 2, 3, 1003, 3
--Delete Order proc
alter proc usp_DeleteOrder
	@ID int
as
begin	
	delete Detail where OrderID = @ID
	delete [Order] where ID = @ID
end	
go
exec usp_DeleteOrder 8
--Top Sales proc
create proc usp_TopSales
	@SalesID int = null
as
begin
	select EmployeeID, Employee.FirstName, Employee.LastName, OrderID, ProductID, UnitPrice, Quantity, Detail.Discount, UnitPrice*Quantity*(1-Discount) as Total 
	from [Order]
	inner join Employee on ([Order].EmployeeID) = Employee.ID
	inner join Detail on ([Order].ID) = Detail.OrderID
	where EmployeeID = @SalesID
end
go 
exec usp_TopSales 1003

--Top Revenue proc
create proc usp_TopReve
	@SaleID int = null,
	@BeginDate date = null,
	@FinishDate date = null
as	
begin
	select [Order].EmployeeID, UnitPrice*Quantity*(1-Discount) as Total 
	from [Order]
	left join Employee on [Order].EmployeeID = Employee.ID
	left join Detail on [Order].ID = Detail.OrderID
	where [Order].EmployeeID = @SaleID and Orderdate between @BeginDate and @FinishDate
end

--Top Revenue proc
alter proc usp_TopRevenue
	@SalesID int = null,
	@BeginDate date = null,
	@FinishDate date = null
as
begin
	select Sum(Quantity*Unitprice*(1-Discount)) as Total 
	from Detail 
	inner join [Order] on OrderID = [Order].ID
	where EmployeeID = @SalesID and OrderDate between @BeginDate and @FinishDate
end
go
exec usp_TopRevenue 1003, '2019-04-01', '2019-04-27'
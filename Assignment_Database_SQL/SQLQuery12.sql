create table [Order]
(
	ID int primary key,
	CustomerID int not null,
	EmployeeID int default 0,
	[Status] int not null
)

create table [Status]
(
	ID int primary key,
	[Status] varchar(20) not null
)

create table Detail
(
	OrderID int,
	ProductID int,
	Delivery_FormID int not null,
	Quantity int not null check(Quantity > 0),
	Discount float not null default 0,
	primary key(OrderID, ProductID)
)

create table Product
(
	ID int primary key,
	[Name] varchar(50) not null,
	UnitPrice money not null check(UnitPrice > 0),
	BrandID int not null,
	TypeID int not null,
	[Year] char(4) check([Year] > 0)
)

alter table Product_Supplier
add Price money check (Price >= ImportPrice);

create table WareHouse
(
	ProductID int,
	SupplierID int,
	ImportPrice money check (ImportPrice > 0),
	Price money check ((Price) >= (ImportPrice)),
	Stock int not null check (Stock > 0),
	[Date] date default getdate(),
	Gift varchar(50) default 'None'
)
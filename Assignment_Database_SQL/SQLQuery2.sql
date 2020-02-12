select * from Customers;
select * from Account;
select * from [Address] order by (ID);

insert into Customer values (1, 'William', 'Anderson', 1, 1974);
insert into Customer values (2, 'Collins', 'Grace', 2, 1983);
insert into Customer values (3, 'Howard', 'Bradly', 3, 1990);
insert into Customer values (4, 'Filbert', 'Clifford', 4, 1987);
insert into Customer values (5, 'Norwood', 'Filbert', 5, 1959);
insert into Customer values (6, 'William', 'Samuel', 1, 1996);
insert into Customer values (7, 'Daisy', 'Anderson', 2, 1967);
insert into Customer values (8, 'Bradly', 'Jason', 3, 1986);
insert into Customer values (9, 'Filbert', 'Nicole', 6, 1998);
insert into Customer values (10, 'Collins', 'Albert', 7, 1999);
insert into Customer values (11, 'Grace', 'Micheal', 8, 1975);
insert into Customer values (12, 'Clifford', 'Richard', 9, 1991);

delete Customer

insert into Account values (1, 'William@gmail.com', '123456', getdate());
insert into Account values (2, 'Collins@gmail.com', '123456', getdate());
insert into Account values (3, 'Howard@gmail.com', '123456', getdate()); 
insert into Account values (4, 'Filbert@gmail.com', '123456',getdate());
insert into Account values (5, 'Norwood@gmail.com', '123456', getdate());
insert into Account values (6, '11234@gmail.com', '11223344', getdate());
insert into Account values (7, 'Daisy@gmail.com', '123456', getdate());
insert into Account values (8, 'Bradly@gmail.com', '123456', getdate());
insert into Account values (9, 'Filbert1@gmail.com', '123456', getdate());
insert into Account values (10, 'Collins009@gmail.com', '123456', getdate());
insert into Account values (11, 'Grace788@gmail.com', '123456', getdate());
insert into Account values (12, '112455@gmail.com', '11334565', getdate());

select Customers.AccountID, Customers.FirstName, Customers.LastName, Customers.[Address], Customers.Born, [User], [Password], RegistrationDate from  Customers inner join Account on AccountID = Account.ID;
select * from [Address] order by (ID);

insert into [Address] values (1, 'Sanfrancisco');
insert into [Address] values (2, 'Ohio');
insert into [Address] values (3, 'Indiana');
insert into [Address] values (4, 'Maine');
insert into [Address] values (5, 'New York');
insert into [Address] values (6, 'New Jersey');
insert into [Address] values (7, 'Miami');
insert into [Address] values (8, 'Allabama');
insert into [Address] values (9, 'Misouri');

create table [Order]
(
	CustomerID int primary key,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	[Address] int not null,
	Born char(4) not null check (Born > 0),
	OrderID int not null unique,
	EmployeeID int not null,
	ProductID int not null,
	UnitPrice money not null check(UnitPrice > 0),
	Quantity int not null check(Quantity > 0),
	Discount float not null default 0
)

insert into [Order] values (1, 'William', 'Anderson', 1, 1974, 101, 201, 1001, 1000, 2, 0);
insert into [Order] values (2, 'Collins', 'Grace', 2, 1983, 102, 202, 1002, 979, 1, 0);
insert into [Order] values (3, 'Howard', 'Bradly', 3, 1990, 103, 203, 1003, 999, 1, 0);
insert into [Order] values (4, 'Filbert', 'Clifford', 4, 1987, 104, 204, 1002, 879, 1, 0);
insert into [Order] values (5, 'Norwood', 'Filbert', 5, 1959, 105, 205, 1002, 979, 1, 0);
insert into [Order] values (6, 'William', 'Samuel', 1, 1996, 106, 206, 1004, 779, 1, 0);
insert into [Order] values (7, 'Daisy', 'Anderson', 2, 1967, 107, 207, 1005, 979, 1, 0);
insert into [Order] values (8, 'Bradly', 'Jason', 3, 1986, 108, 208, 1003, 879, 1, 0);
insert into [Order] values (9, 'Filbert', 'Nicole', 6, 1998, 109, 209, 1005, 579, 1, 0);
insert into [Order] values (10, 'Collins', 'Albert', 7, 1999, 110, 210, 1003, 379, 1, 0);
insert into [Order] values (11, 'Grace', 'Micheal', 8, 1975, 111, 211, 1001, 279, 1, 0);
insert into [Order] values (12, 'Clifford', 'Richard', 9, 1991, 112, 212, 1008, 1079, 1, 0); 

select * from [Order];

create table Orders
(	
	ID int primary key,
	CustomerID int not null,
	EmployeeID int not null,
	ProductID int not null,
	UnitPrice money not null check(UnitPrice > 0),
	Quantity int not null check(Quantity > 0),
	Discount float not null default 0
)

insert into [Orders] values (101, 1, 201, 1001, 1000, 2, 0);
insert into [Orders] values (102, 2, 202, 1002, 979, 1, 0);
insert into [Orders] values (103, 3, 203, 1003, 999, 1, 0);
insert into [Orders] values (104, 4, 204, 1002, 879, 1, 0);
insert into [Orders] values (105, 5, 205, 1002, 979, 1, 0);
insert into [Orders] values (106, 6, 206, 1004, 779, 1, 0);
insert into [Orders] values (107, 7, 207, 1005, 979, 1, 0);
insert into [Orders] values (108, 8, 208, 1003, 879, 1, 0);
insert into [Orders] values (109, 9, 209, 1005, 579, 1, 0);
insert into [Orders] values (110, 10, 210, 1003, 379, 1, 0);
insert into [Orders] values (111, 11, 211, 1001, 279, 1, 0);
insert into [Orders] values (112, 12, 212, 1008, 1079, 1, 0); 

select * from Customer;
select * from Orders;

create view Bill as 
select * from 
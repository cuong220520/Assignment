create table Customers
(
	AccountID int primary key,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	[Address] int not null,
	Born char(4) not null check(Born > 0)
)
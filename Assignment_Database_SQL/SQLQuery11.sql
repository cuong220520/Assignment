create table Customer
(
	AccountID int primary key,
	FirstName varchar(50) not null,
	LastName varchar(50) not null,
	BirthDate date default getdate(),
	AddressID int not null
)
create table Accounts
(
	ID int primary key,
	[User] varchar(50) not null unique,
	[Password] varchar(50) not null,
	RegistrationDate date default getdate()
)
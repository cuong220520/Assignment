create database TryElectroshop

create table Customer
(
	AccountID int primary key,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	[Address] varchar(100) not null,
	Born char(4) not null check (Born > 0)
)

create table Account
(
	ID int primary key,
	[User] varchar(20) not null unique,
	[Password] varchar(20) not null,
	RegistrationDate date default getdate()
)

create table [Order]
(
	ID int primary key,
	CustomerID int not null,
	EmployeeID int not null
)
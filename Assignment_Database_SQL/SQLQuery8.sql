create table Account 
(
	ID int primary key,
	[User] varchar(20) not null unique,
	[Password] varchar(20) not null,
	RegistrationDate date default getdate()
)

alter table [Order]
add Status int not null;
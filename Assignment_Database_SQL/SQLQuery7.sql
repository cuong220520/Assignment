create table Product
(
	ProductID int primary key,
	[Name] varchar(50) not null unique,
	BrandID int not null,
	BrandName varchar(50),
	TypeID int not null,
	[Year] char(4) not null check([Year] > 0)
)

insert into Product values (101, 'Sony Xperia X1', 1, 'Sony', 1, 2014);
insert into Product values (102, 'Iphone 6', 2, 'Apple', 1, 2013);
insert into Product values (103, 'HTC 10', 3, 'HTC', 1, 2014);
insert into Product values (104, 'LG G6', 4, 'LG', 1, 2014);
insert into Product values (105, 'Xiaomi mi5', 5, 'Xiaomi', 1, 2016);
insert into Product values (106, 'Huawei mateX', 6, 'Huawei', 1, 2014);
insert into Product values (107, 'Zenphone Max', 7, 'Asus', 1, 2015);
insert into Product values (108, 'Galaxy S8', 8, 'Samsung', 1, 2016);

select * from Product;
select * from Brand order by ID;

create table Brand
(
	ID int primary key,
	[Name] varchar(50) not null unique,
)

insert into Brand values (1, 'Sony');
insert into Brand values (2, 'Apple');
insert into Brand values (3, 'HTC');
insert into Brand values (4, 'LG');
insert into Brand values (5, 'Xiaomi');
insert into Brand values (6, 'Huawei');
insert into Brand values (7, 'Asus');
insert into Brand values (8, 'Samsung');

select * from Brand;

alter table Product
add constraint FK_Product_Brand foreign key (BrandID) references Brand(ID);

alter table Product
drop column BrandName;
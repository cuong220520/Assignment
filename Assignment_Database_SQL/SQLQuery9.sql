insert into Customer values (1, 'William', 'Anderson', getdate(), 1);
insert into Customer values (2, 'Collins', 'Grace', getdate(), 2);
insert into Customer values (3, 'Howard', 'Bradly', getdate(), 3);
insert into Customer values (4, 'Filbert', 'Clifford', getdate(), 4);
insert into Customer values (5, 'Norwood', 'Filbert', getdate(), 5);
insert into Customer values (6, 'William', 'Samuel', getdate(), 6);
insert into Customer values (7, 'Daisy', 'Anderson', getdate(), 7);
insert into Customer values (8, 'Bradly', 'Jason', getdate(), 8);
insert into Customer values (9, 'Filbert', 'Nicole', getdate(), 1);
insert into Customer values (10, 'Collins', 'Albert', getdate(), 2);
insert into Customer values (11, 'Grace', 'Micheal', getdate(), 3);
insert into Customer values (12, 'Clifford', 'Richard', getdate(), 4);

insert into Accounts values (1, 'William@gmail.com', '123456', getdate());
insert into Accounts values (2, 'Collins@gmail.com', '123456', getdate());
insert into Accounts values (3, 'Howard@gmail.com', '123456', getdate()); 
insert into Accounts values (4, 'Filbert@gmail.com', '123456',getdate());
insert into Accounts values (5, 'Norwood@gmail.com', '123456', getdate());
insert into Accounts values (6, '11234@gmail.com', '11223344', getdate());
insert into Accounts values (7, 'Daisy@gmail.com', '123456', getdate());
insert into Accounts values (8, 'Bradly@gmail.com', '123456', getdate());
insert into Accounts values (9, 'Filbert1@gmail.com', '123456', getdate());
insert into Accounts values (10, 'Collins009@gmail.com', '123456', getdate());
insert into Accounts values (11, 'Grace788@gmail.com', '123456', getdate());
insert into Accounts values (12, '112455@gmail.com', '11334565', getdate());

select * from Customer;
select * from Accounts;
select * from Address order by ID;

insert into [Address]([Name]) values ('Sanfrancisco');
insert into [Address] values (2, 'Ohio');
insert into [Address] values (3, 'Indiana');
insert into [Address] values (4, 'Maine');
insert into [Address] values (5, 'New York');
insert into [Address] values (6, 'New Jersey');
insert into [Address] values (7, 'Miami');
insert into [Address] values (8, 'Allabama');
insert into [Address] values (9, 'Misouri');

insert into Product values (101, 'Xperia 1', 999, 1, 1, 2014);
insert into Product values (102, 'Iphone 6', 399, 2, 1, 2013);
insert into Product values (103, 'HTC One M9', 399, 3, 1, 2014);
insert into Product values (104, 'LG G6', 499, 4, 1, 2014);
insert into Product values (105, 'Xiaomi mi 5', 399, 5, 1, 2016);
insert into Product values (106, 'Huawei MateX', 299, 6, 1, 2014);
insert into Product values (107, 'Asus Zenphone Max', 299, 7, 1, 2015);
insert into Product values (108, 'Galaxy S8', 599, 8, 1, 2016);

insert into BrandID values (1, 'Sony');
insert into BrandID values (2, 'Apple');
insert into BrandID values (3, 'HTC');
insert into BrandID values (4, 'LG');
insert into BrandID values (5, 'Xiaomi');
insert into BrandID values (6, 'Huawei');
insert into BrandID values (7, 'Asus');
insert into BrandID values (8, 'Samsung');

insert into [Type] values (1, 'Cellphone', 'Make PhoneCall, Surf Internet, Play Mobile Games, ...');
insert into [Type] values (2, 'TV', ' Watch Movie, Video, ...');
insert into [Type] values (3, 'Headphone', 'Listen to music');
insert into [Type] values (4, 'Player', 'Save and Play Music with High Quality');
insert into [Type] values (5, 'Tablet', 'Surf Internet, Play Games, ...');

select * from Product;
select * from [Type];
select * from BrandID;

insert into Position values (991, 'Admin');
insert into Position values (992, 'Salesperson');
insert into Position values (993, 'Customer Service');
insert into Position values (994, 'Warehouse staff');

insert into Employee values (1001, 991, 'Dave', 'Town', 1974, '0283989482', getdate());
insert into Employee values (1002, 992, 'Alice', 'Burren', 1993, '019029038', getdate());
insert into Employee values (1003, 992, 'Armin', 'Haswell', 1994, '032874382', getdate());
insert into Employee values (1004, 992, 'Van', 'Bastel', 1990, '102391283', getdate());
insert into Employee values (1005, 993, 'Martin', 'Chole', 1995, '129091044', getdate());
insert into Employee values (1006, 993, 'Asley', 'Town', 1993, '0283989482', getdate());
insert into Employee values (1007, 993, 'Roberto', 'Alley', 1994, '128923814', getdate());
insert into Employee values (1008, 994, 'Andy', 'Cole', 1986, '123678921', getdate());

select * from Employee;
select * from Position;
select * from 
insert into [Order] values (1, 2, 1002, 1);
insert into [Order] values (2, 3, 1003, 2);
insert into [Order] values (3, 4, 1003, 3);
insert into [Order] values (4, 2, 1002, 2);
insert into [Order] values (5, 2, 1004, 2);
insert into [Order] values (6, 5, 1004, 3);
insert into [Order] values (7, 3, 1005, 0);
insert into [Order] values (8, 6, 1003, 2);
insert into [Order] values (9, 7, 1002, 1);
insert into [Order] values (10, 9, 1004, 1);

insert into [Status] values (0, 'Not Confirmed');
insert into [Status] values (1, 'Confirmed');
insert into [Status] values (2, 'Shipping');
insert into [Status] values (3, 'Finished');

select * from [Order];
select * from Product;
select * from Detail;
select * from [Status];
select * from Delivery;

insert into Detail values (1, 102, 1, 2, 0.05);
insert into Detail values (2, 101, 1, 1, 0.05);
insert into Detail values (3, 103, 1, 1, 0.1);
insert into Detail values (4, 104, 1, 1, 0.05);
insert into Detail values (5, 105, 1, 1, 0.1);
insert into Detail values (6, 102, 1, 2, 0.05);
insert into Detail values (7, 101, 2, 2, 0.1);
insert into Detail values (8, 106, 1, 1, 0.05);
insert into Detail values (9, 108, 1, 2, 0.1);
insert into Detail values (10, 103, 1, 3, 0.05);

insert into Delivery values (1, 'Buy at Showroom');
insert into Delivery values (2, 'Domestic Shipping');
insert into Delivery values (3, 'International Shipping');

select * from Supplier;
select * from Product;
select * from Product_Supplier;

insert into Supplier values (111, 'FPT', '112, Ton That Thuyet, Ward 8, District Nam Tu Liem, Ha Noi', '1132133', '12371283', 'FPT@Supp.com');
insert into Supplier values (112, 'The Gioi Di Dong', '134, Ngo Quyen, Ward 10, District Nam Tu Liem, Ha Noi', '114124124', '21687124', 'TGGD@Supp.com');
insert into Supplier values (113, 'Hoang Ha', '773, 3/2, Ward 10, District Ha Dong, Ha Noi', '216371276', '12367814', 'HoangHa@Supp.com');
insert into Supplier values (114, 'TNC', '342, Nguyen Xi, Ward 12, District Nam Tu Liem, Ha Noi', '234567287', '6712838712', 'TNC@Supp.com');
insert into Supplier values (115, 'PlayZone', '362, Pasteur, Ward 1, District Hai Ba Trung, Ha Noi', '123672112', '6371287321', 'PlayZone@Supp.com');

select * from Product_Supplier

insert into Product_Supplier(ProductID, SupplierID, ImportPrice, Stock) values (101, 111, 799, 100);
insert into Product_Supplier(ProductID, SupplierID, ImportPrice, Stock) values (102, 111, 239, 70);
insert into Product_Supplier(ProductID, SupplierID, ImportPrice, Stock) values (103, 112, 199, 100);
insert into Product_Supplier(ProductID, SupplierID, ImportPrice, Stock) values (104, 114, 300, 100);
insert into Product_Supplier(ProductID, SupplierID, ImportPrice, Stock) values (105, 111, 300, 50);
insert into Product_Supplier(ProductID, SupplierID, ImportPrice, Stock) values (106, 115, 159, 100);
insert into Product_Supplier(ProductID, SupplierID, ImportPrice, Stock) values (107, 113, 159, 150);
insert into Product_Supplier(ProductID, SupplierID, ImportPrice, Stock) values (108, 111, 400, 100);

alter table Product 
add [Image] image

create table Payment
(
	OrderID int primary key,
	PaymentMethodID int not null,
	CardNumber varchar(50) default 'CASH'
)

create table PaymentMethod
(
	ID int primary key,
	Method varchar(20)
)

alter table Payment
add PaymentMethod char(4);
select * from Employee;

select * from Product_Supplier;
select * from Product;

select * from [Order]
select * from [Status]
select * from Employee

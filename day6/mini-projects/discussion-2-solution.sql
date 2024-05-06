-- 1. Write DDL statements to create a DB and tables as per the given schema
create table productlines(productline int primary key,textDescription varchar(50),htmlDescription varchar(50),image varchar(100));

create table products(productCode int primary key,productName varchar(35),productLine int,productScale varchar(50),productVendor varchar(100),productDescription 
varchar(50),quantityInStock int,buyPrice decimal(15,2),MSRP decimal(15,2),foreign key products(productLine) references productlines(productLine));

create table orderdetails(orderNumber int,productCode int,quantityOrdered int,priceEach decimal(15,2),orderLineNumber int,
primary key(orderNumber,productCode),foreign key orderdetails(productCode) references products(productCode));

create table offices(officeCode varchar(35) primary key,city varchar(35),phone int(11),addressLine1 varchar(100),addressLine2 varchar(100),state varchar(35),
country varchar(35),postalCode int(6),territory varchar(35));

create table employees(employeeNumber varchar(35) primary key,lastName varchar(35),firstName varchar(35),extension varchar(35),email varchar(50) unique,
officeCode varchar(35),reportTo varchar(35),jobTitle varchar(35),constraint report foreign key employees(reportTo) references employees(employeeNumber),
constraint officecode foreign key employees(officeCode) references offices(officeCode));

create table customers(customeNumber int primary key,customerName varchar(35),contactLastName varchar(35),contactFirstName varchar(35),phone int(11) unique,addressLine1 
varchar(100),addressLine2 varchar(100),city varchar(35),state varchar(35),postalCode int(6),country varchar(35),salesRepEmployeeNumber varchar(35),creditLimit int,
foreign key customers(salesRepEmployeeNumber) references employees(employeeNumber));

create table orders(orderNumber int primary key,orderDate date,requiredDate date,shippedDate date,status varchar(50),comments varchar(50),customerNumber int,
foreign key orders(customerNumber) references customers(customeNumber),foreign key orders(orderNumber) references orderdetails(orderNumber));


drop table if exists Sun_Rentals;
drop table if exists Sun_Videos;
drop table if exists Sun_Format;
drop table if exists Sun_Category;
drop table if exists Sun_Customer;

create table Sun_Customer (Customer_ID int primary key, Last_Name varchar(30), First_Name varchar(30), Address varchar(30), City varchar (30), State char(2), Zip char(5));
create table Sun_Category (Category_ID tinyint primary key, Category_Description varchar(30));
create table Sun_Format (Format_ID tinyint primary key, Format_Description varchar(30));
create table Sun_Videos (Video_ID int primary key, Title varchar(50), Format_ID tinyint, Cost decimal(3, 2), Category_ID tinyint,
	CONSTRAINT FOREIGN KEY (Format_ID)
    REFERENCES Sun_Format(Format_ID),
    CONSTRAINT FOREIGN KEY (Category_ID)
    REFERENCES Sun_Category(Category_ID));
create table Sun_Rentals (Rental_ID int primary key, Date_Out date, Date_Due date, Date_In date, Delivery_Status varchar(12), Late_Fee decimal(3, 2), Customer_ID int, Video_ID int,
	CONSTRAINT FOREIGN KEY (Customer_ID)
    REFERENCES Sun_Customer(Customer_ID),
    CONSTRAINT FOREIGN KEY (Video_ID)
    REFERENCES Sun_Videos(Video_ID));
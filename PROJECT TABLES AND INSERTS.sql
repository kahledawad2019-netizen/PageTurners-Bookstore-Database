
/*1. Create the database*/
use [PageTurners_Bookstore ]

/*2. Create all four tables with appropriate data types*/

create table Books(BOOK_ID INT PRIMARY KEY,
Title varchar(50),
author varchar(50),
ISBN INT UNIQUE,
PRICE MONEY,
Published_YEAR DATE,
Quantity_ln_Stock INT
);

alter table Books 
alter column Published_YEAR VARCHAR(4);

ALTER TABLE Books 
DROP CONSTRAINT UQ__Books__447D36EA1E127D7F ;

ALTER TABLE Books 
alter column ISBN BIGINT();


ALTER TABLE Books
ADD CONSTRAINT UQ_Books_ISBN UNIQUE (ISBN);

INSERT INTO Books VALUES (1,'The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 12.99, 1925,15
),(2,'To Kill a Mockingbird', 'Harper Lee', '9780061120084', 14.50, 1960, 10
),(3,'1984', 'George Orwell', '9780451524935', 10.99, 1949, 8 )





create table Customers(Customer_ID INT PRIMARY KEY,
First_Name varchar(50),
Last_Name varchar(50),
Email VARCHAR(50) UNIQUE,
Phone_Number varchar(50),
   DATE,
);


INSERT INTO Customers VALUES (1,'John', 'Smith', 'john.smith@email.com'
, '555-0101',GETDATE())
,(2,'Sarah', 'Johnson', 'sarahJ@email.com', '555-0102', GETDATE())





create table Sales(Sale_lD INT PRIMARY KEY,
Customer_lD INT FOREIGN KEY REFERENCES Customers ,
 Sale_Date DATE,
Total_Amount MONEY,
);
INSERT INTO Sales VALUES (1,1,GETDATE(),$25.98),(2,2,GETDATE(),$14.50)




create table Sale_Detail(Sale_Detail_lD INT PRIMARY KEY,
Sale_lD INT FOREIGN KEY REFERENCES SALES ,
Book_lD INT FOREIGN KEY REFERENCES Books ,
Quantity_Purchased INT,
Price_At_Sale MONEY,
);

INSERT INTO Sale_Detail  VALUES (1,1,1,2,$51.96),(2,2,2,1,$14.50);


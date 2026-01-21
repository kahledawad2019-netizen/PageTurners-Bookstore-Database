/*STEP4*/
/*1.LSIT THE TITLE AND THE AUTHOR*/
SELECT Title , author
FROM Books
/*2.SHOW THE COUSTOMER ALPHAPITICALLY BU LAST NAME*/
SELECT * FROM Customers
order by Last_Name ASC;
/*3.Display books that have fewer than 10 copies in stock*/
select Quantity_ln_Stock
from Books
where Quantity_ln_Stock <10;
/*4. Find the total number of books in inventory*/
SELECT SUM(Quantity_ln_Stock) AS TOTALBOOKS
FROM Books;
/*5. Show all sales made today*/
select * 
from Sales 
where cast(Sale_Date as date) = cast(GETDATE()as date)
/*6. Update the quantity of " 1984" to 7 copies after selling one*/
UPDATE 	Books
SET Title= 1984 ,author='George Orwell',ISBN='9780451524935',PRICE=10.99,
Published_YEAR=1949,Quantity_ln_Stock=8
WHERE BOOK_ID=3
/*7. Add a new book: "Pride and Prejudice", "Jane Austen", "9780141439518", 9.99,
1813, 12 copies
*/
UPDATE 	Books
SET Quantity_ln_Stock=Quantity_ln_Stock-1
WHERE Title= '1984' 
INSERT INTO Books
VALUES (4,'Pride and Prejudice' 
,'Jane Austen'
,'9780141439518'
,9.99,
1813,
12);
/*8. Delete a customer who hasn't made any purchases (add one first to delete)*/
INSERT INTO Customers(Customer_ID,First_Name,Last_Name,Email)
VALUES (4,'KHALED','AWAD','KAHLEDAWAD@YAHOO.COM')

DELETE FROM Customers
WHERE Customer_ID NOT IN (SELECT Customer_lD FROM Sales);
/*Step 5: Additional Requirements*/
/*1. Add a check constraint to ensure book price is greater than 0
*/
ALTER TABLE Sale_Detail
ADD CONSTRAINT CK_Sale_Price_Positive 
CHECK (Price_At_Sale > 0);

/*2. Add a default value for the registration date (current date)*/

ALTER TABLE Customers
ADD CONSTRAINT Registration_Date_default_today default GETDATE()for Registration_Date;
/*3. Add a column "Genre" to the Books table with values like 'Fiction', 'Non-Fiction',
'Mystery*/
alter table Books	
add Genre varchar(50) ;
Alter table Books
add constraint CK_Books_Genre
check (Genre in('fiction','Non-Fiction','Mystery'));

/*4. Create a query that shows book title, author, and price for all books in the 'Fiction'
genre*/

select Title,author,PRICE
from Books
where Genre = 'Fiction' ;









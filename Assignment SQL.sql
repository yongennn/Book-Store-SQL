CREATE TABLE CUSTOMER (
    CustomerID VARCHAR(50) PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Customer_Contact VARCHAR(50),
    Customer_Email VARCHAR(50),
    Customer_Address VARCHAR(100)
);

INSERT INTO CUSTOMER (CustomerID, Customer_Name, Customer_Contact, Customer_Email, Customer_Address)
VALUES 
('C001', 'Marcus', '015-8672344', 'MC88@hotmail.com', '368-37-6, Wisma A, Penang'),
('C002', 'Steve', '016-4792189', 'Steve55@yahoo.com', '350-26-5, Vista Tower A'),
('C003', 'Michelle', '014-7647890', 'Michelle00@hotmail.com', '98, Jalan Tun Perak'),
('C004', 'Janice', '017-5637862', 'Janice66@gmail.com', '368-37-6, Wisma A'),
('C005', 'Steven', '019-3756332', 'Steve@hotmail.com', '8, Jalan indah, Kampung Indah, Ampang'),
('C006', 'Johnson', '013-3674378', 'Johnss@yahoo.com', '728-39-9, Merdeka resident'),
('C007', 'Ng Hui Hui', '016-1893354', 'HuiHui99@gmail.com', '88, Jalan Ampang, 53100 Ampang'),
('C008', 'Kee Sun', '018-3085959', 'Kee89@gmail.com', '45, Jalan imbian, 55000 Federal Kuala Lumpur'),
('C009', 'Genice', '010-3209435', 'Genice44@yahoo.com', '66, Kampungg indah, 53100 Ampang'),
('C010', 'Klaus', '017-1372978', 'Klaus66@gmail.com', '78, Trillion park, 46800, Petaling Jaya');

SELECT * FROM CUSTOMER;

CREATE TABLE PUBLISHER (
    PublishersID VARCHAR(50) PRIMARY KEY,
    Publishers_Name VARCHAR(50),
    Publishers_Contact VARCHAR(50),
    Publishers_Country VARCHAR(50)
);

INSERT INTO PUBLISHER (PublishersID, Publishers_Name, Publishers_Country, Publishers_Contact)
VALUES 
('P001', 'GM Publisher', 'Germany', '49-174 777 8899'),
('P002', 'Haruki House', 'Japan', '81-392 394 6540'),
('P003', 'Cemerlang Books', 'Malaysia', '019-3688912'),
('P004', 'Penguin Books', 'England', '49-151 637 9730'),
('P005', 'Yang Jun Publisher', 'China', '86-132 3829 5849'),
('P006', 'HH House', 'China', '86-132 3829 2893'),
('P007', 'Syabas Books', 'Malaysia', '014-2814948'),
('P008', 'Milky Books', 'Malaysia', '019-2873082'),
('P009', 'Taylor House', 'England', '49-151 231 4546'),
('P010', 'GG Publisher', 'England', '49-151 897 2132');

SELECT * FROM PUBLISHER;

CREATE TABLE MANAGER (
    ManagerID VARCHAR(50) PRIMARY KEY,
    Manager_Name VARCHAR(50),
    Manager_Contact VARCHAR(50)
);
INSERT INTO MANAGER (ManagerID, Manager_Name, Manager_Contact)
VALUES
('M001','Joyce','017-4849012'),
('M002','Jayden','019-2489748'),
('M003','Joshua','016-2748394'),
('M004','Peter','018-2174867'),
('M005','Jane','019-2184956'),
('M006','Kris','012-3901283'),
('M007','Tao','019-2382041'),
('M008','Jay Park','010-1893718'),
('M009','Giselle','013-1297432'),
('M010','Winter','017-3891283');

SELECT * FROM MANAGER;

CREATE TABLE BOOK (
    Books_ID VARCHAR(50) PRIMARY KEY,
    Book_Name VARCHAR(50),
    Books_Genre VARCHAR(50),
    Books_Language VARCHAR(50),
    Book_instockquantity VARCHAR(100),
    Unit_Price VARCHAR(50),
    PublisherID VARCHAR(50),
    ManagersID VARCHAR(50),
    FOREIGN KEY (PublisherID) REFERENCES PUBLISHER(PublishersID),
    FOREIGN KEY (ManagersID) REFERENCES MANAGER(ManagerID)
);
INSERT INTO BOOK (Books_ID,Book_Name,Books_Genre,Books_Language,Book_instockquantity,Unit_Price,PublisherID,ManagersID)
VALUES
('74401','Beauty and the Beast','Fairy Tale','English','15','$35.00','P001','M001'),
('74402','What is AI','Novel','English','13','$45.00','P002','M002'),
('74403','Harry Potter','Fantasy Listerature','Bahasa Melayu','25','$60.30','P003','M003'),
('74404','Twilight','Romance','English','9','$55.40','P004','M004'),
('74405','Annabele','Horror','Chinese','16','$38.25','P005','M005'),
('74406','Cinta akan Kamu','Romance','Bahasa Melayu','5','$55.40','P007','M003'),
('74407','Snow White','Fairy Tale','Chinese','7','$35.00','P005','M005'),
('74408','Frozen','Fairy Tale','English','12','$35.00','P004','M004'),
('74409','The Maze','Fantasy Literature','Bahasa Melayu','8','$60.30','P003','M003'),
('74410','Love You Forever','Romance','English','5','$55.40','P004','M004');
SELECT * FROM BOOK;

CREATE TABLE ORDERS_TABLE (
    OrdersID VARCHAR(50) PRIMARY KEY,
    CustomerID VARCHAR(50),
    PaymentsID VARCHAR(50),
    Delivery_Status VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
);
INSERT INTO ORDERS_TABLE (OrdersID,CustomerID,PaymentsID,Delivery_Status)
VALUES
('OD001','C001','P001','Delivered'),
('OD002','C003','P002','Delivered'),
('OD003','C001','P003','Delivered'),
('OD004','C005','P004','Pending'),
('OD005','C010','P005','Delivered'),
('OD006','C008','P006','Delivered'),
('OD007','C006','P007','Delivered'),
('OD008','C001','P008','Delivered'),
('OD009','C002','P009','Delivered'),
('OD010','C004','P010','Delivered');
SELECT * FROM ORDERS_TABLE;

CREATE TABLE BOOKS_ORDERS (
    OrdersID VARCHAR(50),
    BooksID VARCHAR(50),
    Books_OrderQuantity VARCHAR(50),
    Total_Price VARCHAR(50),
    PRIMARY KEY (OrdersID, BooksID),
    FOREIGN KEY (BooksID) REFERENCES BOOK(Books_ID),
    FOREIGN KEY (OrdersID) REFERENCES ORDERS_TABLE(OrdersID)
);
INSERT INTO BOOKS_ORDERS (OrdersID,BooksID,Books_OrderQuantity,Total_Price)
VALUES
('OD001','74401','1','$35.00'),
('OD001','74403','2','$120.60'),
('OD002','74406','4','$221.60'),
('OD003','74408','2','$70.00'),
('OD004','74404','1','$55.40'),
('OD004','74407','2','$70.00'),
('OD004','74408','1','$35.00'),
('OD005','74402','3','$135.00'),
('OD006','74403','1','$60.30'),
('OD007','74408','2','$70.00'),
('OD008','74402','5','$225.00'),
('OD009','74410','2','$110.80'),
('OD010','74409','1','$60.30');
SELECT * FROM BOOKS_ORDERS;

CREATE TABLE PREORDER_ITEM (
    ShoppingCarts_ID VARCHAR(50),
    CustomerID VARCHAR(50),
    BooksID VARCHAR(50)NULL,
    Quantity VARCHAR(50),
    Checked_Out VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (BooksID) REFERENCES BOOK(Books_ID)
);
INSERT INTO PREORDER_ITEM (ShoppingCarts_ID,CustomerID,BooksID,Quantity,Checked_Out)
VALUES
('SC001','C001','74401','1','Y'),
('SC001','C001','74403','2','Y'),
('SC001','C001','74408','2','Y'),
('SC001','C001','74402','5','Y'),
('SC002','C002','74410','2','Y'),
('SC003','C003','74406','4','Y'),
('SC004','C004','74409','1','Y'),
('SC004','C004','74407','2','Y'),
('SC004','C004','74408','1','Y'),
('SC005','C005','74404','1','Y'),
('SC006','C006','74408','2','Y'),
('SC007','C007','74405','2','N'),
('SC008','C008','74403','1','Y'),
('SC009','C009',NULL,NULL,NULL),
('SC010','C010','74402','3','Y');
SELECT * FROM PREORDER_ITEM;

CREATE TABLE REVIEW (
    ReviewID VARCHAR(50) PRIMARY KEY,
    CustomerID VARCHAR(50),
    BooksID VARCHAR(50),
    OrderID VARCHAR(50),
    ReviewText VARCHAR(100),
    Rating VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (BooksID) REFERENCES BOOK(Books_ID),
    FOREIGN KEY (OrderID) REFERENCES ORDERS_TABLE(OrdersID)
);
INSERT INTO REVIEW (ReviewID,CustomerID,BooksID,OrderID,ReviewText,Rating)
VALUES
('R001','C001','74401','OD001','Nice Book','4'),
('R002','C001','74403','OD001','Okok La','3'),
('R003','C003','74406','OD002','So so','2'),
('R004','C001','74408','OD003','So so','2'),
('R005','C010','74402','OD005','Will recommend to my friend','4'),
('R006','C008','74403','OD006','Will buy again','5'),
('R007','C006','74408','OD007','Best','5'),
('R008','C001','74402','OD008','Average la','3'),
('R009','C002','74410','OD009','Not Bad','3'),
('R010','C004','74409','OD010','No Bad','3');
SELECT * FROM REVIEW;

CREATE TABLE PAYMENT_TABLE (
    PaymentID VARCHAR(50) PRIMARY KEY,
    OrdersID VARCHAR(50),
    Orders_TotalPrice VARCHAR(50),
    Payment_Method VARCHAR(50),
    Receipt VARCHAR(50),
    FOREIGN KEY (OrdersID) REFERENCES ORDERS_TABLE(OrdersID)
);
INSERT INTO PAYMENT_TABLE (PaymentID,OrdersID,OrderS_TotalPrice,Payment_Method,Receipt)
VALUES
('P001','OD001','$155.60','Online Banking','R001'),
('P002','OD002','$221.60','COD','R002'),
('P003','OD003','$70.00','COD','R003'),
('P004','OD004','$160.40','E-wallet','R004'),
('P005','OD005','$135.00','Online Banking','R005'),
('P006','OD006','$60.30','E-wallet','R006'),
('P007','OD007','$70.00','COD','R007'),
('P008','OD008','$225.00','Online Banking','R008'),
('P009','OD009','$110.80','E-wallet','R009'),
('P010','OD010','$60.30','Online Banking','R010');
SELECT * FROM PAYMENT_TABLE;

CREATE TABLE MANAGER_ORDER (
    ManagerID VARCHAR(50),
    BookID VARCHAR(50),
    PublisherID VARCHAR(50),
    Order_TotalQuantity VARCHAR(50),
    FOREIGN KEY (ManagerID) REFERENCES MANAGER(ManagerID),
    FOREIGN KEY (BookID) REFERENCES BOOK(Books_ID),
    FOREIGN KEY (PublisherID) REFERENCES PUBLISHER(PublishersID)
);
INSERT INTO MANAGER_ORDER (ManagerID,BookID,PublisherID,Order_TotalQuantity)
VALUES
('M001','74401','P001','15'),
('M002','74402','P002','12'),
('M003','74403','P003','21'),
('M004','74404','P004','13'),
('M005','74405','P005','43'),
('M003','74406','P007','21'),
('M005','74407','P005','12'),
('M004','74408','P004','23'),
('M003','74409','P003','12'),
('M004','74410','P004','34');
SELECT * FROM MANAGER_ORDER;

#STUDENT ONE
--Q1--
SELECT * FROM PREORDER_ITEM
WHERE Checked_Out = 'N' OR Checked_Out IS NULL ;

--Q2--
SELECT REVIEW.BooksID,BOOK.Book_Name, AVG(CAST(REVIEW.Rating AS FLOAT)) AS AverageRating
FROM REVIEW 
JOIN BOOK ON REVIEW.BooksID = BOOK.Books_ID
GROUP BY REVIEW.BooksID, BOOK.Book_Name
ORDER BY AverageRating DESC
LIMIT 1;

--Q3--
SELECT PUBLISHER.PublishersID, PUBLISHER.Publishers_Name, COUNT(BOOK.Books_ID) AS NumberofBooks
FROM PUBLISHER 
LEFT JOIN BOOK ON PUBLISHER.PublishersID = BOOK.PublisherID
GROUP BY PUBLISHER.PublishersID, PUBLISHER.Publishers_Name
ORDER BY NumberofBooks DESC;

#STUDENT TWO
--Q1--
SELECT c.CustomerID, c.Customer_Name, COUNT(r.ReviewID) AS total_reviews
FROM CUSTOMER c
LEFT JOIN REVIEW r ON c.CustomerID = r.CustomerID
GROUP BY c.CustomerID, c.Customer_Name;

--Q2--
SELECT p.PublishersID, p.Publishers_Name, COUNT(b.Books_ID) AS Total_Books
FROM PUBLISHER p
JOIN BOOK b ON p.PublishersID = b.PublisherID
GROUP BY p.PublishersID, p.Publishers_Name
ORDER BY Total_Books DESC
LIMIT 1;

--Q3--
SELECT m.ManagerID, m.Manager_Name, p.PublishersID, p.Publishers_Name,
	SUM(CAST(o.Order_TotalQuantity AS INT)) AS Total_Books_Ordered
FROM MANAGER m
JOIN MANAGER_ORDER o ON m.ManagerID = o.ManagerID
JOIN PUBLISHER p ON o.PublisherID = p.PublishersID
GROUP BY m.ManagerID, m.Manager_Name, p.PublishersID, p.Publishers_Name;

#STUDENT THREE
--Q1--
SELECT * FROM BOOK
WHERE Book_instockquantity = (
    SELECT MAX(Book_instockquantity)
    FROM BOOK);

--Q2--
SELECT BOOK.Book_Name, BOOKS_ORDERS.BooksID, SUM(CAST(BOOKS_ORDERS.Books_OrderQuantity AS INT)) AS TotalOrderQuantity
FROM BOOKS_ORDERS
JOIN BOOK ON BOOKS_ORDERS.BooksID = BOOK.Books_ID
GROUP BY BOOK.Book_Name, BOOKS_ORDERS.BooksID
ORDER BY TotalOrderQuantity DESC;

--Q3--
SELECT ORDERS_TABLE.CustomerID, CUSTOMER.Customer_Name, 
SUM(CAST(REPLACE(PAYMENT_TABLE.Orders_TotalPrice, '$', '') AS DECIMAL(10,2))) AS Total_Spent
FROM ORDERS_TABLE
JOIN PAYMENT_TABLE ON ORDERS_TABLE.OrdersID = PAYMENT_TABLE.OrdersID
JOIN CUSTOMER ON ORDERS_TABLE.CustomerID = CUSTOMER.CustomerID
GROUP BY ORDERS_TABLE.CustomerID, CUSTOMER.Customer_Name
ORDER BY Total_Spent DESC
LIMIT 1;

#STUDENT FOUR
--Q1--
SELECT * FROM CUSTOMER C
LEFT JOIN ORDERS_TABLE o ON c.CustomerID = o.CustomerID
WHERE o.OrdersID is null;

--Q2--
SELECT *
FROM ORDERS_TABLE
WHERE Delivery_Status <> 'Delivered'

--Q3--
SELECT c.CustomerID, c.Customer_Name, COUNT (o.OrdersID) AS Order_Count
FROM Customer c
JOIN Orders_table o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Customer_Name
HAVING COUNT (o.OrdersID) > 2;
CREATE DATABASE Bookmarket

/*2:
 1. Посчитать количество "смешанных" заказов за день
 2. Посчитать количество заказов в которых содержится книга "N"
 3. Посчитать продажи за месяц по автору(количество книг и денежный эквивалент)
 4. Вывести все заказы по определенному пользователю где были только электронные книги
 5. Количество успешных доставок, по определенному пользователю, где количество книг > 2*/

CREATE TABLE Customer
(
 "id"      int NOT NULL,
 name_customer    varchar(50) NOT NULL ,
 surname_customer varchar(50) NOT NULL ,
 nameOfBook varchar(50),
 CONSTRAINT PK_Customer PRIMARY KEY ( "id" )
);

CREATE TABLE Order
(
    "id"      int NOT NULL,
    date_order date,
    date_payment date,
    date_done date,
    FOREIGN KEY (date_done) REFERENCES Delivery(date_done) ON DELETE CASCADE,
    CONSTRAINT PK_order PRIMARY KEY ( "id" )

);

CREATE TABLE Delivery(
    "id"      int NOT NULL,
    typeOfDelivery varchar(50),
    date_done date,
    reciever varchar(50), 
    CONSTRAINT PK_delivery PRIMARY KEY ( "id" )
);

CREATE TABLE Order_Book(
    book_id int NOT NULL,
    order_id int not NULL,
    book_name varchar(50),
    book_type varchar(50),
    author varchar(50),

    FOREIGN KEY(author) REFERENCES Book(author) ON DELETE CASCADE,
    FOREIGN KEY(book_id) REFERENCES Book(book_id) ON DELETE CASCADE,
    FOREIGN KEY (order_id) REFERENCES Order(order_id) ON DELETE CASCADE,
    FOREIGN KEY(book_name) REFERENCES Book(book_name) ON DELETE CASCADE,
    FOREIGN KEY(book_type) REFERENCES Book(book_type) ON DELETE CASCADE

);

CREATE TABLE Book(
    "id"      int NOT NULL,
    weight_book varchar(50),
    cover_type varchar(50),
    pages int,
    author varchar(50),
    publisher varchar(50),
    book_name varchar(50),
    book_type varchar(50),
    CONSTRAINT PK_delivery PRIMARY KEY ( "id" )


);

--Посчитать количество "смешанных" заказов за день
SELECT COUNT (*)
FROM Order
WHERE book_type="book" AND book_type="e-book" AND date_done=DAY(GETDATE());


--Посчитать количество заказов в которых содержится книга "N"

SELECT COUNT(*)
FROM Order
WHERE book_name="N";

--Посчитать продажи за месяц по автору(количество книг и денежный эквивалент)
SELECT COUNT(*)
FROM Order_Book
WHERE author="Lev Tolstoi" AND date

--Вывести все заказы по определенному пользователю где были только электронные книги
SELECT *
FROM Order
WHERE book_type="e-book" AND 

--Количество успешных доставок, по определенному пользователю, где количество книг > 2
SELECT COUNT(*)
FROM Delivery
WHERE reciever="Harry Potter" AND
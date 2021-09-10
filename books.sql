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
    id_customer int NOT NULL,
    date_order date,
    date_payment date,
    date_done date,
    OREIGN KEY(id_customer) REFERENCES Customer("id"),
    CONSTRAINT PK_order PRIMARY KEY ( "id" )

);

CREATE TABLE Payment(
    "id" int NOT NULL,
    summ float,
    order_id int NOT NULL,
    reciever varchar(30),
    CONSTRAINT PK_payment PRIMARY KEY("id"),
    FOREIGN KEY(order_id) REFERENCES Order("id") ON DELETE CASCADE
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

    FOREIGN KEY(book_id) REFERENCES Book(book_id) ON DELETE CASCADE,
    FOREIGN KEY (order_id) REFERENCES Order(order_id) ON DELETE CASCADE,
   

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
SELECT COUNT *
FROM Order JOIN Order_Book ON Order.primarykey=Order_Book.foreignkey JOIN Order_Book ON Book Book.primarykey=Order_Book.foreignkey
WHERE Order.date_order=GETDAY() AND Book.book_type="ebook" AND Book.book_type="book"


--Посчитать количество заказов в которых содержится книга "N"

SELECT COUNT *
FROM Order JOIN Order_Book ON Order.primarykey=Order_Book.foreignkey JOIN Order_Book ON Book Book.primarykey=Order_Book.foreignkey
WHERE Book.name="N"



--тут дописать сумм как-то добавлять еще таблицы пеймент_ордер и делать джоин еще 2х?
SELECT COUNT *,
FROM Order JOIN Order_Book ON Order.primarykey=Order_Book.foreignkey JOIN Order_Book ON Book Book.primarykey=Order_Book.foreignkey
WHERE Book.author="Lev Tolstoi" AND YEAR(Order.date_done)=2021 AND MOUNTH(Order.date_done)=9


--Вывести все заказы по определенному пользователю где были только электронные книги
SELECT  *
FROM Order JOIN Order_Book ON Order.primarykey=Order_Book.foreignkey JOIN Order_Book ON Book Book.primarykey=Order_Book.foreignkey
WHERE Order.customer_id=1 AND Book.book_type="ebook"

--Количество успешных доставок, по определенному пользователю, где количество книг > 2


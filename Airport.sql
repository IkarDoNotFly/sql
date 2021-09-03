CREATE DATABASE Airport


CREATE TABLE Passenger
(
 "id"      int NOT NULL,
 namePassenger    varchar(50) NOT NULL ,
 surnamePassenger varchar(50) NOT NULL ,
 numberOfTickets int,
 CONSTRAINT PK_passenger PRIMARY KEY ( "id" )
);

CREATE TABLE Ticket
(
 "number"   int NOT NULL,
 baggage  smallint NOT NULL,
 typeMenu varchar(50) NOT NULL,
 "date"     date NOT NULL,
 cost     real NOT NULL,
 pointA varchar(50) NOT NULL,
 pointB varchar(50) NOT NULL,
 namePassenger     varchar(50) NOT NULL,
 surnamePassenger  varchar(50) NOT NULL,
 CONSTRAINT PK_ticket PRIMARY KEY ( "number" ),
 FOREIGN KEY(namePassenger) REFERENCES Passenger(namePassenger) ON DELETE CASCADE ,
 FOREIGN KEY(surnamePassenger) REFERENCES Passenger(surnamePassenger) ON DELETE CASCADE ,
 FOREIGN KEY(pointA) REFERENCES Cities(name) ON DELETE CASCADE ,
 FOREIGN KEY(pointB) REFERENCES Cities(name) ON DELETE CASCADE 
);



CREATE TABLE Cities
(
 "id"   int NOT NULL,
 name  NOT NULL,
 CONSTRAINT PK_cities PRIMARY KEY ( "id" )
);

--1.Выбрать все билеты в пункт Б, за 1 месяц
SELECT * FROM Ticket
WHERE pointB="Kyiv" AND MONTH("date")=8;
-- 2. Выбрать всех пассажиров, у которых багаж превышал 10 кг
SELECT * 
FROM Ticket
WHERE baggage>10;
-- 3. Посчитать количество пассажиров, которые заказывали больше одного билеты
SELECT COUNT (*)
FROM Passenger
WHERE numberOfTickets>1;
--4. Высчитать общую массу перевезенного багажа за месяц
SELECT MONTH(date) as "month",SUM(baggage) 
FROM Passenger
WHERE MONTH(date)=8;

-- 5. Высчитать средний багаж пассажиров
SELECT AVG(baggage) AS SUM_BAGGAGE
FROM Ticket;

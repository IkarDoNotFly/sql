CREATE DATABASE Airport


CREATE TABLE Passenger
(
 "id"      int NOT NULL,
 name_passenger    varchar(50) NOT NULL ,
 surname_passenger varchar(50) NOT NULL ,
 CONSTRAINT PK_passenger PRIMARY KEY ( "id" )
);

CREATE TABLE Ticket
(
 "number"   int NOT NULL,
 baggage  smallint NOT NULL,
 type_menu varchar(50) NOT NULL,
 "date"     date NOT NULL,
 cost     real NOT NULL,
 point_a varchar(50) NOT NULL,
 point_b varchar(50) NOT NULL,
 id_passenger int NOT NULL,
 CONSTRAINT PK_ticket PRIMARY KEY ( "number" ),
 FOREIGN KEY(id_passenger) REFERENCES Passenger(id_passenger) ON DELETE CASCADE ,
 FOREIGN KEY(point_a) REFERENCES Cities(name) ON DELETE CASCADE ,
 FOREIGN KEY(point_b) REFERENCES Cities(name) ON DELETE CASCADE
);



CREATE TABLE Cities
(
 "id"   int NOT NULL,
 name varchar(50) NOT NULL,
 CONSTRAINT PK_cities PRIMARY KEY ( "id" )
);

--1.Выбрать все билеты в пункт Б, за 1 месяц
SELECT * FROM Ticket
WHERE point_b="Kyiv" AND MONTH("date")=8;
-- 2. Выбрать всех пассажиров, у которых багаж превышал 10 кг
SELECT * 
FROM Ticket
WHERE baggage>10;
-- 3. Посчитать количество пассажиров, которые заказывали больше одного билеты
SELECT COUNT (*)
FROM Passenger
WHERE number_of_tickets>1;
--4. Высчитать общую массу перевезенного багажа за месяц
SELECT MONTH(date) as "month",SUM(baggage) 
FROM Passenger
WHERE MONTH(date)=8;

-- 5. Высчитать средний багаж пассажиров
SELECT AVG(baggage) AS SUM_BAGGAGE
FROM Ticket;

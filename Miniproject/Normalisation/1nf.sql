--Original (UNF) Table
CREATE TABLE Members_UNF
(
    Member_Id NUMBER PRIMARY KEY,
    First_Name VARCHAR2(30),
    Last_Name VARCHAR2(30),
    Hobbies VARCHAR2(100)
);

INSERT INTO Members_UNF VALUES (101,'Jayson','Mark','Cricket,Swimming,Football');
INSERT INTO Members_UNF VALUES (102,'Ram','Ganesh','Swimming,Running,Music');
INSERT INTO Members_UNF VALUES (103,'Raj','Kishore','Dancing,Singing,Running');

COMMIT;

SELECT * FROM Members_UNF;
--1NF Table
CREATE TABLE Members_1NF
(
    Member_Id NUMBER,
    First_Name VARCHAR2(30),
    Last_Name VARCHAR2(30),
    Hobby VARCHAR2(30)
);

INSERT INTO Members_1NF VALUES (101,'Jayson','Mark','Cricket');
INSERT INTO Members_1NF VALUES (101,'Jayson','Mark','Swimming');
INSERT INTO Members_1NF VALUES (101,'Jayson','Mark','Football');

INSERT INTO Members_1NF VALUES (102,'Ram','Ganesh','Swimming');
INSERT INTO Members_1NF VALUES (102,'Ram','Ganesh','Running');
INSERT INTO Members_1NF VALUES (102,'Ram','Ganesh','Music');

INSERT INTO Members_1NF VALUES (103,'Raj','Kishore','Dancing');
INSERT INTO Members_1NF VALUES (103,'Raj','Kishore','Singing');
INSERT INTO Members_1NF VALUES (103,'Raj','Kishore','Running');

COMMIT;

SELECT * FROM Members_1NF;
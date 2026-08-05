--Original Table
CREATE TABLE Members3_UNF
(
    Member_Id NUMBER PRIMARY KEY,
    First_Name VARCHAR2(30),
    Last_Name VARCHAR2(30),
    Sports VARCHAR2(30),
    Fees NUMBER
);

INSERT INTO Members3_UNF VALUES (101,'Rajesh','Chand','Cricket',100);
INSERT INTO Members3_UNF VALUES (102,'Jayesh','Raj','Hockey',80);
INSERT INTO Members3_UNF VALUES (103,'Mark','Dorson','Football',90);

COMMIT;

SELECT * FROM Members3_UNF;
--Sports Table
CREATE TABLE Sports_3NF
(
    Sport_Id NUMBER PRIMARY KEY,
    Sport_Name VARCHAR2(30),
    Fees NUMBER
);

INSERT INTO Sports_3NF VALUES (1,'Cricket',100);
INSERT INTO Sports_3NF VALUES (2,'Hockey',80);
INSERT INTO Sports_3NF VALUES (3,'Football',90);

COMMIT;

SELECT * FROM Sports_3NF;
--Member Table
CREATE TABLE Member_3NF
(
    Member_Id NUMBER PRIMARY KEY,
    First_Name VARCHAR2(30),
    Last_Name VARCHAR2(30),
    Sport_Id NUMBER,
    FOREIGN KEY (Sport_Id) REFERENCES Sports_3NF(Sport_Id)
);

INSERT INTO Member_3NF VALUES (101,'Rajesh','Chand',1);
INSERT INTO Member_3NF VALUES (102,'Jayesh','Raj',2);
INSERT INTO Member_3NF VALUES (103,'Mark','Dorson',3);

COMMIT;

SELECT * FROM Member_3NF;
--JOIN
SELECT
M.Member_Id,
M.First_Name,
M.Last_Name,
S.Sport_Name,
S.Fees
FROM Member_3NF M
JOIN Sports_3NF S
ON M.Sport_Id = S.Sport_Id;
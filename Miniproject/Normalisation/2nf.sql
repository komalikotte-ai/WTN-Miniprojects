-- original table
CREATE TABLE EmployeeTraining_UNF
(
    EmpNo NUMBER,
    Training VARCHAR2(40),
    Training_Date DATE,
    Dept VARCHAR2(10),
    PRIMARY KEY(EmpNo,Training)
);

INSERT INTO EmployeeTraining_UNF
VALUES (101,'Oracle SQL',TO_DATE('12-08-2015','DD-MM-YYYY'),'TT');

INSERT INTO EmployeeTraining_UNF
VALUES (101,'Java',TO_DATE('21-08-2015','DD-MM-YYYY'),'BU');

INSERT INTO EmployeeTraining_UNF
VALUES (102,'Oracle SQL',TO_DATE('18-09-2014','DD-MM-YYYY'),'TT');

COMMIT;

SELECT * FROM EmployeeTraining_UNF;

--Employee Table
CREATE TABLE Employee_2NF
(
    EmpNo NUMBER PRIMARY KEY,
    Dept VARCHAR2(10)
);

INSERT INTO Employee_2NF VALUES (101,'BU');
INSERT INTO Employee_2NF VALUES (102,'TT');

COMMIT;

SELECT * FROM Employee_2NF;

--Training Table
CREATE TABLE Training_2NF
(
    EmpNo NUMBER,
    Training VARCHAR2(40),
    Training_Date DATE,
    PRIMARY KEY(EmpNo,Training),
    FOREIGN KEY(EmpNo) REFERENCES Employee_2NF(EmpNo)
);

INSERT INTO Training_2NF
VALUES (101,'Oracle SQL',TO_DATE('12-08-2015','DD-MM-YYYY'));

INSERT INTO Training_2NF
VALUES (101,'Java',TO_DATE('21-08-2015','DD-MM-YYYY'));

INSERT INTO Training_2NF
VALUES (102,'Oracle SQL',TO_DATE('18-09-2014','DD-MM-YYYY'));

COMMIT;

SELECT * FROM Training_2NF;
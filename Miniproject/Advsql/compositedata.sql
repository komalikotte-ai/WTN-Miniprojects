--Create the tables Lodge_Details, Skill_Details, EMP_Details and EMP_Skill with appropriate primary and foreign key constraints.
CREATE TABLE Lodge_Details(Lodge_Name VARCHAR2(30) PRIMARY KEY,Lodge_Manager VARCHAR2(30) NOT NULL,Lodge_Address VARCHAR2(50));

CREATE TABLE Skill_Details(Skill VARCHAR2(30) PRIMARY KEY,Skill_Desc VARCHAR2(50));

CREATE TABLE EMP_Details(Empno NUMBER PRIMARY KEY,First_Name VARCHAR2(30) NOT NULL,Last_Name VARCHAR2(30) NOT NULL,Lodge_Name VARCHAR2(30),CONSTRAINT fk_lodge FOREIGN KEY(Lodge_Name) REFERENCES Lodge_Details(Lodge_Name));

CREATE TABLE EMP_Skill(Empno NUMBER,Skill VARCHAR2(30),Grade NUMBER,CONSTRAINT pk_emp_skill PRIMARY KEY(Empno,Skill),CONSTRAINT fk_emp FOREIGN KEY(Empno) REFERENCES EMP_Details(Empno),CONSTRAINT fk_skill FOREIGN KEY(Skill) REFERENCES Skill_Details(Skill));
--Insert the records into all the tables and display the contents.
INSERT INTO Lodge_Details VALUES('Jessy Lodge','Rajan','Rakesh Nagar');
INSERT INTO Lodge_Details VALUES('Rajesh Lodge','Rajani','Anna Nagar');
INSERT INTO Lodge_Details VALUES('Gooday Lodge','John','Sea Road');

INSERT INTO Skill_Details VALUES('Oracle SQL','Oracle Database');
INSERT INTO Skill_Details VALUES('Sybase','Database Technology');
INSERT INTO Skill_Details VALUES('Dot Net','.NET Framework');

INSERT INTO EMP_Details VALUES(101,'James','Jackson','Rajesh Lodge');
INSERT INTO EMP_Details VALUES(102,'Kalpesh','Raj','Gooday Lodge');
INSERT INTO EMP_Details VALUES(103,'Jasmine','Joy','Jessy Lodge');

INSERT INTO EMP_Skill VALUES(101,'Oracle SQL',9);
INSERT INTO EMP_Skill VALUES(101,'Sybase',8);
INSERT INTO EMP_Skill VALUES(102,'Dot Net',9);
INSERT INTO EMP_Skill VALUES(103,'Oracle SQL',8);

COMMIT;

SELECT * FROM Lodge_Details;
SELECT * FROM Skill_Details;
SELECT * FROM EMP_Details;
SELECT * FROM EMP_Skill
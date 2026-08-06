--Employee 101 has changed his lodge to Gooday Lodge.
UPDATE EMP_Details SET Lodge_Name='Gooday Lodge' WHERE Empno=101;
--Employee 103 has resigned from the company and vacated the lodge, so delete his details from the respective tables.
DELETE FROM EMP_Skill WHERE Empno=103;
DELETE FROM EMP_Details WHERE Empno=103;
-- Display the employee with skill Sybase. Pass Sybase in any case using function.
SELECT * FROM EMP_Skill WHERE UPPER(Skill)=UPPER('Sybase');
--Display First_Name, Skill and Lodge Manager.
SELECT E.First_Name, ES.Skill, L.Lodge_Manager FROM EMP_Details E JOIN EMP_Skill ES ON E.Empno=ES.Empno JOIN Lodge_Details L ON E.Lodge_Name=L.Lodge_Name;
--Display the number of skills employee 101 has.
SELECT COUNT(*) AS Number_of_Skills FROM EMP_Skill WHERE Empno=101;

--Display the employee First_Name who has the skill Oracle SQL.
SELECT E.First_Name FROM EMP_Details E JOIN EMP_Skill ES ON E.Empno=ES.Empno WHERE ES.Skill='Oracle SQL';
--Create a View EMP_VIEW containing EMPNO, FIRST_NAME, SKILL and LODGE_MANAGER.
CREATE VIEW EMP_VIEW AS SELECT E.Empno,E.First_Name,ES.Skill,L.Lodge_Manager FROM EMP_Details E JOIN EMP_Skill ES ON E.Empno=ES.Empno JOIN Lodge_Details L ON E.Lodge_Name=L.Lodge_Name;
-- Create a Synonym EMPV for the View EMP_VIEW.
CREATE SYNONYM EMPV FOR EMP_VIEW;
--Create an Index on Skill column in EMP_Skill table.
CREATE INDEX IDX_EMP_SKILL ON EMP_Skill(Skill);

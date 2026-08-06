--Create the Bank table.
CREATE TABLE Bank(Account_Number NUMBER PRIMARY KEY,Bank_Name VARCHAR2(30) NOT NULL,Amount NUMBER(10,2) NOT NULL);
--Create Package Bank_Transaction with required methods.
CREATE OR REPLACE PACKAGE Bank_Transaction AS
PROCEDURE New_Account(Account_Number NUMBER,Bank_Name VARCHAR2,Amount NUMBER);
PROCEDURE Account_Transaction(Account_Number NUMBER,Transaction_Amount NUMBER,Transaction_Type VARCHAR2);
PROCEDURE Close_Account(Account_Number NUMBER);
END Bank_Transaction;
/

CREATE OR REPLACE PACKAGE BODY Bank_Transaction AS

FUNCTION Account_Exists(Account_Number NUMBER) RETURN BOOLEAN IS
v_count NUMBER;
BEGIN
SELECT COUNT(*) INTO v_count FROM Bank WHERE Bank.Account_Number=Account_Exists.Account_Number;
RETURN v_count>0;
END;

PROCEDURE New_Account(Account_Number NUMBER,Bank_Name VARCHAR2,Amount NUMBER) IS
BEGIN
IF NOT Account_Exists(Account_Number) THEN
INSERT INTO Bank VALUES(Account_Number,Bank_Name,Amount);
END IF;
EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

PROCEDURE Account_Transaction(Account_Number NUMBER,Transaction_Amount NUMBER,Transaction_Type VARCHAR2) IS
v_amount NUMBER;
BEGIN
IF Account_Exists(Account_Number) THEN
SELECT Amount INTO v_amount FROM Bank WHERE Bank.Account_Number=Account_Transaction.Account_Number;
IF UPPER(Transaction_Type)='D' THEN
IF v_amount-Transaction_Amount>=5000 THEN
UPDATE Bank SET Amount=Amount-Transaction_Amount WHERE Bank.Account_Number=Account_Transaction.Account_Number;
END IF;
ELSIF UPPER(Transaction_Type)='W' THEN
IF v_amount-Transaction_Amount>=5000 THEN
UPDATE Bank SET Amount=Amount-Transaction_Amount WHERE Bank.Account_Number=Account_Transaction.Account_Number;
END IF;
ELSIF UPPER(Transaction_Type)='P' THEN
UPDATE Bank SET Amount=Amount+Transaction_Amount WHERE Bank.Account_Number=Account_Transaction.Account_Number;
END IF;
END IF;
EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

PROCEDURE Close_Account(Account_Number NUMBER) IS
BEGIN
IF Account_Exists(Account_Number) THEN
DELETE FROM Bank WHERE Bank.Account_Number=Close_Account.Account_Number;
END IF;
EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

END Bank_Transaction;
--Create the Audit_Table
CREATE TABLE Audit_Table(Account_Number NUMBER,Transaction_Date TIMESTAMP,Transaction_Type CHAR(1));
--Create a trigger on Bank table for Insert, Update and Delete.
CREATE OR REPLACE TRIGGER Bank_Audit_Trigger
AFTER INSERT OR UPDATE OR DELETE ON Bank
FOR EACH ROW
BEGIN
IF INSERTING THEN
INSERT INTO Audit_Table VALUES(:NEW.Account_Number,SYSTIMESTAMP,'I');
ELSIF UPDATING THEN
INSERT INTO Audit_Table VALUES(:OLD.Account_Number,SYSTIMESTAMP,'U');
ELSIF DELETING THEN
INSERT INTO Audit_Table VALUES(:OLD.Account_Number,SYSTIMESTAMP,'D');
END IF;
END;
/
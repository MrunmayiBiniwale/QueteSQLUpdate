USE master

--Create database if not exists
IF NOT (EXISTS (SELECT name FROM sys.databases 
WHERE ('[' + name + ']' = 'CustomerDb' 
OR name = 'CustomerDb')))
BEGIN    
    CREATE DATABASE CustomerDb;
END

--Use the newly created database
USE CustomerDb

--Drop table Customer if already exists
IF OBJECT_ID('Customer', 'U') IS NOT NULL 
BEGIN
    DROP TABLE Customer;
END

--Create table Customer
CREATE TABLE Customer 
(
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(128),  
)

--Insert the data in the Customer

INSERT INTO Customer (Name) VALUES ('Mrunmayi');
INSERT INTO Customer (Name) VALUES ('Pravin');

--Update Customer to add 'z' at the end of all records
UPDATE Customer
SET Name = Name + 'z';

SELECT * FROM Customer;

--Transaction
BEGIN TRANSACTION T;

BEGIN TRY

--Remove the 'z' from all the records
UPDATE Customer 
SET name = TRIM('Z' from name);

COMMIT TRANSACTION T;

END TRY
BEGIN CATCH

--Rollback transaction if anything goes wrong
ROLLBACK TRANSACTION T;

END CATCH

SELECT * FROM Customer;



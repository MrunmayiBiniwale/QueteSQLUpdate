USE master

IF NOT (EXISTS (SELECT name FROM sys.databases 
WHERE ('[' + name + ']' = 'CustomerDb' 
OR name = 'CustomerDb')))
BEGIN    
    CREATE DATABASE CustomerDb;
END

USE CustomerDb

IF OBJECT_ID('Customer', 'U') IS NOT NULL 
BEGIN
    DROP TABLE Customer;
END

CREATE TABLE Customer 
(
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(128),  
)

--INSERT THE DATA

INSERT INTO Customer (Name) VALUES ('Mrunmayi');
INSERT INTO Customer (Name) VALUES ('Pravin');

UPDATE Customer
SET Name = Name + 'z';

SELECT * FROM Customer;

BEGIN TRANSACTION T;

UPDATE Customer 
SET name = TRIM('Z' from name);

COMMIT TRANSACTION T;

SELECT * FROM Customer;



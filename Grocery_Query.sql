CREATE DATABASE Grocery_Demo


CREATE TABLE Grocery_Branch
(Grocery_Branch_No INTEGER IDENTITY(1,1) PRIMARY KEY,
 Grocery_Branch_Name VARCHAR(50) UNIQUE NOT NULL,
 Grocery_Branch_Address VARCHAR(50) UNIQUE NOT NULL,
 Grocery_Phone_No VARCHAR(20) UNIQUE NOT NULL
 )
 
INSERT INTO Grocery_Branch (Grocery_Branch_Name,Grocery_Branch_Address,Grocery_Phone_No)
VALUES('Inala','39 Lavender Street, Inala QLD 4077','0423957193')
INSERT INTO Grocery_Branch (Grocery_Branch_Name,Grocery_Branch_Address,Grocery_Phone_No)
VALUES('Richlands','1 Progress Road, Richlands QLD 4077','0423957192')
INSERT INTO Grocery_Branch (Grocery_Branch_Name,Grocery_Branch_Address,Grocery_Phone_No)
VALUES ('Forest Lake','235 Forest Lake Boulevard, Forest Lake QLD 4078','0423957191')


CREATE TABLE Product_Category
(Product_Category_No INTEGER IDENTITY(1,1) PRIMARY KEY,
 Product_Category_Name VARCHAR(20) UNIQUE NOT NULL
 )

INSERT INTO Product_Category (Product_Category_Name)
VALUES ('Beverage')
INSERT INTO Product_Category (Product_Category_Name)
VALUES ('Canned Food')
INSERT INTO Product_Category (Product_Category_Name)
VALUES ('Cooking Oil')
INSERT INTO Product_Category (Product_Category_Name)
VALUES ('Dairy')
INSERT INTO Product_Category (Product_Category_Name)
VALUES ('Dry Fish')
INSERT INTO Product_Category (Product_Category_Name)
VALUES ('Eggs')
INSERT INTO Product_Category (Product_Category_Name)
VALUES ('Flour')
INSERT INTO Product_Category (Product_Category_Name)
VALUES ('Frozen')
INSERT INTO Product_Category (Product_Category_Name)
VALUES ('Fruits')
INSERT INTO Product_Category (Product_Category_Name)
VALUES ('Honey')
INSERT INTO Product_Category (Product_Category_Name)
VALUES ('Rice')
INSERT INTO Product_Category (Product_Category_Name)
VALUES ('Snacks')
INSERT INTO Product_Category (Product_Category_Name)
VALUES ('Spices')
INSERT INTO Product_Category (Product_Category_Name)
VALUES ('Sweets')
INSERT INTO Product_Category (Product_Category_Name)
VALUES ('Vegetables')


CREATE TABLE Product
(ID INTEGER IDENTITY(1,1) NOT NULL ,
 Product_No AS RIGHT ('PDT0000' + CAST(ID AS VARCHAR(10)),10) PERSISTED PRIMARY KEY CLUSTERED,
 Product_Image VARBINARY (MAX) NOT NULL,
 Product_Name VARCHAR(50) NOT NULL,
 Product_Category_No INTEGER NOT NULL FOREIGN KEY REFERENCES Product_Category(Product_Category_No),
 Product_Price MONEY NOT NULL,
 Product_Quantity INTEGER NOT NULL,
 Grocery_Branch_No INTEGER NOT NULL FOREIGN KEY REFERENCES Grocery_Branch(Grocery_Branch_No),
 Barcode_No VARCHAR(20) 
 )




CREATE TABLE Administrator
(Administrator_No INTEGER IDENTITY(1,1) PRIMARY KEY,
 Administrator_Name VARCHAR(50) NOT NULL,
 Administrator_Username VARCHAR(30) UNIQUE NOT NULL,
 Administrator_Password VARCHAR(30) NOT NULL,
 Administrator_Phone_No VARCHAR(20) NOT NULL,
 Administrator_Email VARCHAR(30) UNIQUE NOT NULL,
 Grocery_Branch_No INTEGER NOT NULL FOREIGN KEY REFERENCES Grocery_Branch(Grocery_Branch_No)
 )


 CREATE TABLE Token
 (Token_No VARCHAR(20) NOT NULL
 )










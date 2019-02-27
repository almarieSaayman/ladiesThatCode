#Start with using Takealot as an example for incase there are people
#who do not know what an ecommerce website is. Maybe give a formal
#definition of ecommerce.

#Ecommerce website:
#eCommerce websites are online portals that facilitate online transactions of goods and services.

#Draw a basic diagram showing the relationship between manufacturer and product. Diagram in slides.
#Then idicate that we will now create those relationships using SQL.

#Do the below step by step and explain what you are doing.
#Also mention that if they do not understand something, they needn't worry we will explain it again (this is only a showcase)

#Step 1: Create database
CREATE DATABASE Ecommerce;

#Step 2: Use that database just created
USE Ecommerce; #This tells MySQL to use the Ecommerce database as the default database for subsequent queries

#Step 3: Create the manufacturer table
CREATE TABLE Manufacturer (
	ManufacturerId int NOT NULL AUTO_INCREMENT, #ID column is of type int and will hold an integer, the value it holds cannot be NULL, AUTO_INCREMENT attribute can be used to generate a unique identity for new rows
	Name varchar(255), #Name column is of type varchar and will hold characters, and the maximum length for these fields is 255 characters
    Description varchar(255),
    PRIMARY KEY (ManufacturerId) #PRIMARY KEY constraint uniquely identifies each record in a table. A table can have only one primary key
);

#Step 4: Create the product table
CREATE TABLE Product (
	ProductId int NOT NULL AUTO_INCREMENT,
	Name varchar(255),
    Price DECIMAL(7,2), #The DECIMAL data type stores exact numeric data values. This data type is used when it is important to preserve exact precision. DECIMAL(M, D) M is the maximum amount of digits, D is the number of digits to the right of the decimal
    ManufacturerId int,
    PRIMARY KEY (ProductId),
    FOREIGN KEY (ManufacturerId) REFERENCES Manufacturer(ManufacturerId) #FOREIGN KEY is a key used to link two tables together.
);

#Step 5: Insert data into the Manufacturer table
INSERT INTO Manufacturer (Name, Description) 
VALUES ('Kenwood South Africa', 'Kenwood was founded on the guiding principles of quality, innovation and design.');
#Since we added AUTO_INCREMENT to the ManufacturerId field in the Manufacturer table, when inserting data, it will automatically generate our id's for us

INSERT INTO Manufacturer (Name, Description) 
VALUES ('Patio Solution Covers (Pty) Ltd', 'Patio Solution Covers is a family run and owned business, and it has been since the day it opened doors in 2007.');

#Step 6: Insert data into the Product table
#Since we have created 2 manufacturers, we can now create some products and link them to a specific manufacturer.
#Take a look at the manufacturer table and note the manufacturerId for each manufacturer. We will use that manufacturerId
#to link our new product to that manufacturer.
#Note: The price added here is not the product's real price I made up a price
INSERT INTO Product (Name, Price, ManufacturerId) 
VALUES ('Citrus Juicer JE280', 549.99, 1);

INSERT INTO Product (Name, Price, ManufacturerId) 
VALUES ('Kenwood Food Processor FP190', 1199.99, 1);

INSERT INTO Product (Name, Price, ManufacturerId) 
VALUES ('Kenwood Smoothie Maker SB266', 1345.99, 1);

#Now lets add some products for the Patio Solution Covers Manufacturer, take note that the Patio Solution Covers MaufacturerId in the Manufacturer
#table is 2.
INSERT INTO Product (Name, Price, ManufacturerId) 
VALUES ('Gas Braai Cover', 899, 2);

#Step 7: Select all product that belong to a specific manufacturer
SELECT * FROM Product
WHERE ManufacturerId = 1;
#This selects all the products for the Kenwood Manufacturer

SELECT * FROM Product
WHERE ManufacturerId = 2;
#This selects all the products for the Patio Solutions Manufacturer

#Step 8: Delete manufacturer along with their products
#We can't just go do this:
DELETE FROM Manufacturer
WHERE ManufacturerId = 1;
#You will get an error along the lines of this: 'Cannot delete of update a parent row: a foreign key constraing fails...'
#That is because we have created a link between the data in the Manufacturer table and the data in the Product table.
#Therefore we need to clear up all the data in the product table linked to the Manufacturere first, before clearing up the data in the Manufacturer table
DELETE FROM Product
WHERE ManufacturerId = 1;
#Now go back and execute the previous query again, this time though the query should be successful.

#Step 9: Quick chat about how we use applications to interact with the database
#An example of where you would not use an application to interact with your database is when you need to do some data fixes
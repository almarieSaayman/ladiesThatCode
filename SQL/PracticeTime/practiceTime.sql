CREATE DATABASE Fakealot;
USE Fakealot;

CREATE TABLE Customer(
	customerId INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    surname VARCHAR(255),
    email VARCHAR(255),
    contactNumber BIGINT(11),
    PRIMARY KEY(customerId)
);

-- Having countries in a seperate table allows you to define which countries you cater for. It also forces the user to choose one of the countries
-- that you have defined, otherwise the user can just type anything into the country field.
CREATE TABLE Country(
	countryId INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255),
    PRIMARY KEY(countryId)
);

-- Each customer can have many delivery addresses
CREATE TABLE DeliveryAddress(
	addressId INT NOT NULL AUTO_INCREMENT,
    addressLine1 VARCHAR(255),
    addressLine2 VARCHAR(255),
    postcode VARCHAR(150),
    countryId INT NOT NULL,
    customerId INT NOT NULL,
    PRIMARY KEY(addressId),
    FOREIGN KEY (countryId) REFERENCES Country(countryId),
    FOREIGN KEY (customerId) REFERENCES Customer(customerId)
);

CREATE TABLE Product(
	productId INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    description VARCHAR(255),
    price DECIMAL(10,2),
    PRIMARY KEY(productId)
);

-- One customer can have many orders, and each order can have multiple products
CREATE TABLE Orders(
	orderId INT NOT NULL AUTO_INCREMENT,
    customerId INT NOT NULL,
    addressId INT,
    deliveryDateTime DATETIME,
    paid BOOLEAN,
    PRIMARY KEY(orderId),
    FOREIGN KEY (addressId) REFERENCES DeliveryAddress(addressId),
    FOREIGN KEY (customerId) REFERENCES Customer(customerId)
);

CREATE TABLE OrderDetails(
	orderDetailId INT NOT NULL AUTO_INCREMENT,
    orderId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY(orderDetailId),
    FOREIGN KEY (orderId) REFERENCES Orders(orderId),
	FOREIGN KEY (productId) REFERENCES Product(productId)
);

INSERT INTO Country (name) VALUES
('Australia'),
('Brazil'),
('Germany'),
('South Africa'),
('Sweden'),
('United Stated');

INSERT INTO Customer (name, surname, email, contactNumber) VALUES
('Luca', 'Eady', 'LucaEady@armyspy.com', 0297780209),
('Lucy', 'Connely', 'LucyConnely@armyspy.com', 0397756444),
('Matilda', 'McGuinness', 'MatildaMcGuinness@jourrapide.com', 0890655332),
('Alex', 'Almeida', 'AlexCostaAlmeida@dayrep.com', 1128924893),
('Nicolas', 'Dias', 'NicolasBarrosDias@jourrapide.com', 1940326034),
('Renan', 'Pereira', 'RenanBarrosPereira@teleworm.us', 1448355956),
('Mathias', 'Herman', 'MathiasHerman@dayrep.com', 06400532934),
('Doreen', 'Wechsler', 'DoreenWechsler@jourrapide.com', 02662794586),
('Benjamin', 'Schmitt', 'BenjaminSchmitt@teleworm.us', 02193770649),
('Almarie', 'Saayman', 'almarie@yahoo.com', 0725698745),
('Claire', 'Jones', 'ClaireJones@dayrep.com', 0823658543),
('Winston', 'Harris', 'WinstonHarris@dayrep.com', 0625244218),
('Vide', 'Ivarsson', 'VideIvarsson@rhyta.com', 04338294627),
('Milla', 'Sjöberg', 'MillaSjoberg@armyspy.com', 6701054204),
('Kevin', 'Lund', 'KevinLund@teleworm.us', 03469615699),
('Enrique', 'Zapata', 'EnriqueKZapata@teleworm.us', 7405683817),
('Stephanie', 'Grantham', 'StephanieSGrantham@armyspy.com', 2055630129),
('Virginia', 'Duncan', 'VirginiaBDuncan@jourrapide.com', 3042841940);

INSERT INTO DeliveryAddress (addressLine1, addressLine2, postcode, countryId, customerId) VALUES
('20 Woodlands Avenue', 'HARRIS PARK NSW', '2150', 1, 1),
('27 Cedar Street', 'HALIFAX QLD', '4850', 1, 1),
('96 Devon Street', 'BLACK FOREST SA', '5035', 1, 1),
('5 Nerrigundah Drive', 'BLIND BIGHT VIC', '3980', 1, 2),
('82 Baker Street', 'EMU POINT WA', '6330', 1, 3),
('53 Benny Street', 'LILLICO TAS', '7310', 1, 3),
('Praça Carlos Campos de Barros, 253', 'São Paulo-SP', '03678-130', 2, 4),
('Rua Treze de Maio, 296', 'Lins-SP', '16400-045', 2, 5),
('Rua José André Erler, 989', 'Poços de Caldas-MG', '37706-246', 2, 5),
('Alameda Américo Polidoro, 291', 'Ourinhos-SP', '19910-254', 2, 6),
('Hollander Strasse 34', 'Mücke', '35325', 3, 7),
('Buelowstrasse 94', 'Hattert', '57644', 3, 8),
('Lietzenburger Strasse 50', 'Wermelskirchen', '42929', 3, 9),
('153 Peterson Ave', 'Houghton Johannesburg', '4021', 4, 10),
('12 Allison Lane', 'Randburg Johannesburg', '2094', 4, 11),
('36 Willow street', 'Auckland Johannesburg', '2094', 4, 11),
('72 Grayston drive', 'Sandton Johannesburg', '2091', 4, 11),
('254 Lynwood Ave', 'Hatfield Pretoria', '1043', 4, 12),
('Vansövägen 93', 'STRÖMNÄSBRUK', '287 33', 5, 13),
('Bottna Knutsgård 33', 'NACKA', '131 19', 5, 13),
('Läktargatan 98', 'MÖRARP', '260 34', 5, 14),
('Tulpanv 43', 'ÄTRAN', '310 61', 5, 15),
('Nils Grises Sträte 75', 'SVENSHÖGEN', '444 82', 5, 15),
('Djursbo 26', 'SIVERDALEN', '577 37', 5, 15),
('1182 Jessie Street', 'Marietta, OH', '45750', 6, 16),
('2444 Hall Place', 'De Berry, TX', '75639', 6, 16),
('3417 Broad Street', 'Birmingham, AL', '35203', 6, 17),
('4934 Highland Drive', 'Little Chute, WI', '54140', 6, 17),
('3114 Froe Street', 'Morgantown, WV', '26505', 6, 18),
('2315 Rocky Road', 'Philadelphia, PA', '19104', 6, 18);

-- Lets assume the currency for all products is ZAR, if you want to include other currencies a possible solution is to add an additional column that indicates the currency.
INSERT INTO Product (name, description, price) VALUES 
('Salton - Oil Fin Heater', 'The Salton Oil Fin Heater comes with 9 Fins and 3 Heat settings for extra warmth during those cold winter nights', 699.99), 
('Skone Shefford Steel Ladies Watch', 'Designed for the sophisticated lady, the Shefford Ladies collection is perfect for casual and formal wear.', 269.00),
('Fragram - 3 Step Ladder', 'These ladders are sturdy in construction and offer the user great stability and safety in use.', 349.20),
('Weber - Q1200 Gas Grill - Black', 'Durable, but lightweight, the cast-aluminium construction of the Weber Q 1200 makes this super-portable grill the perfect tailgating companion.', 3999.00),
('Philips - Daily Collection Blender', 'Only Philips offers you this reliable and long lasting blender with excellent performance to make silky smoothies, fine sauces, well grinded condiments and ice crushing.', 375.00),
('Salton - Double Electric Blanket', 'This luxury fleecy blanket is put around your mattress like a fitted sheet, so it does not move around like regular electric blankets.', 499.00),
('Midea - Oil Heater 9 Fin - Black', 'Midea provides the best home heating systems. Highly efficient, long-lasting heat.', 1179.00),
('Romoss Solo 3 6000mAh Power Bank', 'Made from high-quality fibre, this Romoss 6000mAH Power Bank charger is compatible with almost all smartphones, iPhones.', 229.00),
('RCR- Combo Crystal Glass Whiskey Set', 'High-quality crystal glass -Lead-free. Made in Italy', 649.00),
('Casals - Sander Polisher - 1200W 180mm', 'Introducing the Casals sander polisher, there is no bonnet this powerful 1200W polisher cannot shine.', 999.00),
('Mellerware - Ma Baker Bread Maker', 'The ma-baker breadmaker forms part of the Mellerware contemporary range of small appliances.', 959.00),
('Battlefield V (PC)', 'Enter mankind\'s greatest conflict with Battlefield V as the series goes back to its roots in a never-before-seen portrayal of World War 2.', 899.00),
('MTS - Steel Shelving', 'Multipurpose steel shelving for storing up to 320kg, with wood shelves.', 959.00),
('Rugs Original Silky - Rose & Ivory Isphan', 'These imported machine-made carpets are made with polypropylene.', 600.00),
('Ctek - D250Sa Dc Charger', 'The dual input D250SA allows you to enjoy your vehicle more with maximized battery capacity as the ideal charger for vehicles without access to a mains power supply.', 5199.00),
('Zuru Rainbocorns Plush Egg', 'Inside each unicorn, the egg is a Rainbocorn Sequin Surprise, each having a hidden sequin heart surprise and a BIG personality!', 629.00),
('Hisense - 8kg Front Loader - Silver', '15 automatic programs. Child Lock function. Time delay function for your time saving. Self-diagnostic fault-finding.', 4599.00),
('Automatic Infrared Soap Dispenser', 'Simply elegant counter-top soap dispenser with automatic sensor pump is both stylish and easy to use as well as refill.', 269.00);

-- The paid column indicates whether the customer has paid. The customer can create an order but fakealot
-- can decide not to action the order until the paid column is set to true.
INSERT INTO Orders (customerId, addressId, deliveryDateTime, paid) VALUES
(10, 14, '2019-02-15 16:00:01', true),
(10, 14, NULL, false),
(11, 15, '2018-11-22 14:15:22', true),
(11, 16, '2019-01-24 09:31:45', true),
(11, 17, '2019-05-30 12:12:55', true),
(11, 17, '2019-07-29 10:55:12', true),
(12, 18, NULL, false);

INSERT INTO OrderDetails (orderId, productId, quantity) VALUES 
(1, 8, 1),
(1, 9, 1),
(1, 18, 1),
(2, 1, 1),
(3, 5, 1),
(3, 6, 1),
(4, 16, 2),
(5, 17, 1),
(6, 14, 1),
(6, 4, 1),
(7, 12, 1),
(7, 9, 1);
CREATE DATABASE IF NOT EXISTS gosackDB;
USE gosackDB;

CREATE TABLE IF NOT EXISTS homes (
   appliances TEXT,
   interiorFeatures TEXT,
   construction TEXT,
   roof TEXT,
   exterior TEXT,
   flooring TEXT,
   homeId INT PRIMARY KEY AUTO_INCREMENT,
   homeAddress TEXT,
   price INT,
   beds INT,
   baths INT,
   rooms INT,
   stories INT,
   floorSize INT,
   spaces TEXT,
   houseDescription TEXT,
   houseType TEXT,
   yearBuilt INT,
   heating TEXT,
   cooling TEXT,
   parking INT,
   lotSize INT,
   daysListed INT,
   saves INT);

LOAD DATA INFILE '/var/lib/mysql/data.csv'
INTO TABLE homes
FIELDS TERMINATED BY ';';
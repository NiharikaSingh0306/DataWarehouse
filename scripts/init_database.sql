/*
Create database and schemes:
==================================
script purpose:
  this script creates a new database after checking it it already exists.
  if it exists, it is dropped and recreates.Additionally , the srcipts sets up three schemas within the data base:bronze,silver,gold
*/

USE master;
CREATE DATABASE DataWarehouse;

USE DataWarehouse;

CREATE SCHEMA bronze;
GO 
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO

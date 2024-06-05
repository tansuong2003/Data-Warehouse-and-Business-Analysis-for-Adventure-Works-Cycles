/****** Object:  Database AWP    Script Date: 23-May-24 6:21:36 PM ******/
/*
Kimball Group, The Microsoft Data Warehouse Toolkit
Generate a database from the datamodel worksheet, version: 4

You can use this Excel workbook as a data modeling tool during the logical design phase of your project.
As discussed in the book, it is in some ways preferable to a real data modeling tool during the inital design.
We expect you to move away from this spreadsheet and into a real modeling tool during the physical design phase.
The authors provide this macro so that the spreadsheet isn't a dead-end. You can 'import' into your
data modeling tool by generating a database using this script, then reverse-engineering that database into
your tool.

Uncomment the next lines if you want to drop and create the database
*/
/*
DROP DATABASE AWP
GO
CREATE DATABASE AWP
GO
ALTER DATABASE AWP
SET RECOVERY SIMPLE
GO
*/
USE AWP
;
IF EXISTS (SELECT Name from sys.extended_properties where Name = 'Description')
    EXEC sys.sp_dropextendedproperty @name = 'Description'
EXEC sys.sp_addextendedproperty @name = 'Description', @value = 'Default description - you should change this.'
;





/* Drop table dbo.DimCategory */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimCategory') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimCategory 
;

/* Create table dbo.DimCategory */
CREATE TABLE dbo.DimCategory (
   [ProductCategorKey]  int IDENTITY  NOT NULL
,  [ProductCategoryName]  nvarchar(5)   NOT NULL
, CONSTRAINT [PK_dbo.DimCategory] PRIMARY KEY CLUSTERED 
( [ProductCategorKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCategory
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimCategory', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCategory
;

SET IDENTITY_INSERT dbo.DimCategory ON
;
INSERT INTO dbo.DimCategory (ProductCategorKey, ProductCategoryName)
VALUES (-1, '')
;
SET IDENTITY_INSERT dbo.DimCategory OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductCategoryName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'ProductCategorKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductCategoryName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'ProductCategoryName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'ProductCategorKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'ProductCategoryName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1,2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'ProductCategorKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'ALFKI', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'ProductCategoryName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'ProductCategorKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'ProductCategoryName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'ProductCategorKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'ProductCategoryName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'ProductCategoryName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'ProductCategoryName'; 
;





/* Drop table dbo.DimCustomer */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimCustomer') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimCustomer 
;

/* Create table dbo.DimCustomer */
CREATE TABLE dbo.DimCustomer (
   [CustomerKey]  int IDENTITY  NOT NULL
,  [Perfix]  nvarchar(5)   NOT NULL
,  [FirstName]  nvarchar(40)   NOT NULL
,  [LastName]  nvarchar(30)   NULL
,  [BirthDate]  nvarchar(30)   NOT NULL
,  [Gender]  nvarchar(15)   NOT NULL
,  [EmailAddress]  nvarchar(15)  DEFAULT 'N/A' NOT NULL
,  [FullName]  nvarchar(15)   NOT NULL
, CONSTRAINT [PK_dbo.DimCustomer] PRIMARY KEY CLUSTERED 
( [CustomerKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomer
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimCustomer', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomer
;

SET IDENTITY_INSERT dbo.DimCustomer ON
;
INSERT INTO dbo.DimCustomer (CustomerKey, Perfix, FirstName, LastName, BirthDate, Gender, EmailAddress, FullName)
VALUES (-1, '', '', '', '', '', 'NA', '')
;
SET IDENTITY_INSERT dbo.DimCustomer OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Perfix', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Perfix'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FirstName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'LastName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'BirthDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Gender', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmailAddress', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'EmailAddress'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FullName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FullName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Perfix'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer''s company Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of contact at the company', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Contact''s job title', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Country of origin', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'State or province', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'EmailAddress'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customers City', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FullName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1,2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'ALFKI', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Perfix'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Bon app', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Pedro Alfanso', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Owner, Sales Rep.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'USA', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'WA', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'EmailAddress'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Seattle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FullName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Perfix'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'EmailAddress'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FullName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Perfix'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'EmailAddress'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FullName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Perfix'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'EmailAddress'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FullName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Perfix'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'EmailAddress'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FullName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Perfix'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'EmailAddress'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FullName'; 
;





/* Drop table dbo.DimShippers */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimShippers') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimShippers 
;

/* Create table dbo.DimShippers */
CREATE TABLE dbo.DimShippers (
   [ShippersKey]  int IDENTITY  NOT NULL
,  [ShippersID]  nvarchar(10)   NOT NULL
, CONSTRAINT [PK_dbo.DimShippers] PRIMARY KEY CLUSTERED 
( [ShippersKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimShippers
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimShippers', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimShippers
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Shippers dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimShippers
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShippers', @level2type=N'COLUMN', @level2name=N'ShippersKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShippers', @level2type=N'COLUMN', @level2name=N'ShippersID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShippers', @level2type=N'COLUMN', @level2name=N'ShippersKey'; 
;





/* Drop table dbo.DimSuppliers */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimSuppliers') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimSuppliers 
;

/* Create table dbo.DimSuppliers */
CREATE TABLE dbo.DimSuppliers (
   [SuppliersKey]  int IDENTITY  NOT NULL
,  [SuppliersID]  nvarchar(10)   NOT NULL
, CONSTRAINT [PK_dbo.DimSuppliers] PRIMARY KEY CLUSTERED 
( [SuppliersKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimSuppliers
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimSuppliers', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimSuppliers
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Suppliers Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimSuppliers
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSuppliers', @level2type=N'COLUMN', @level2name=N'SuppliersKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSuppliers', @level2type=N'COLUMN', @level2name=N'SuppliersID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSuppliers', @level2type=N'COLUMN', @level2name=N'SuppliersKey'; 
;





/* Drop table dbo.DimCalendar */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimCalendar') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimCalendar 
;

/* Create table dbo.DimCalendar */
CREATE TABLE dbo.DimCalendar (
   [date]  int IDENTITY  NOT NULL
,  [day]  date   NOT NULL
,  [month]  date   NOT NULL
,  [year]  int   NULL
,  [Quarter]  int   NULL
,  [Weekday]  nvarchar(15)   NOT NULL
, CONSTRAINT [PK_dbo.DimCalendar] PRIMARY KEY CLUSTERED 
( [date] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCalendar
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimCalendar', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCalendar
;

SET IDENTITY_INSERT dbo.DimCalendar ON
;
INSERT INTO dbo.DimCalendar (date, day, month, year, Quarter, Weekday)
VALUES (-1, '', '', NULL, NULL, '')
;
SET IDENTITY_INSERT dbo.DimCalendar OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'date'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'day'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'month', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'month'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'year'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Quarter', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Weekday', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'Weekday'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'date'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'day'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer''s company Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'month'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of contact at the company', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'year'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Contact''s job title', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Country of origin', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'Weekday'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1,2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'date'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'ALFKI', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'day'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Bon app', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'month'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Pedro Alfanso', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'year'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Owner, Sales Rep.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'USA', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'Weekday'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'date'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'day'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'month'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'year'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'Weekday'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'date'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'day'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'month'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'year'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'Weekday'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'day'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'month'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'year'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'Weekday'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'day'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'month'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'year'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCalendar', @level2type=N'COLUMN', @level2name=N'Weekday'; 
;





/* Drop table dbo.DimTerritory */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimTerritory') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimTerritory 
;

/* Create table dbo.DimTerritory */
CREATE TABLE dbo.DimTerritory (
   [TerritoryKey]  int IDENTITY  NOT NULL
,  [Region]  nvarchar(5)   NOT NULL
,  [Country]  nvarchar(40)   NOT NULL
,  [Continent]  nvarchar(30)   NULL
, CONSTRAINT [PK_dbo.DimTerritory] PRIMARY KEY CLUSTERED 
( [TerritoryKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimTerritory
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimTerritory', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimTerritory
;

SET IDENTITY_INSERT dbo.DimTerritory ON
;
INSERT INTO dbo.DimTerritory (TerritoryKey, Region, Country, Continent)
VALUES (-1, '', '', '')
;
SET IDENTITY_INSERT dbo.DimTerritory OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TerritoryKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'TerritoryKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Region', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Region'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Continent', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Continent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'TerritoryKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Region'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer''s company Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of contact at the company', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Continent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1,2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'TerritoryKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'ALFKI', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Region'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Bon app', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Pedro Alfanso', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Continent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'TerritoryKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Region'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Continent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'TerritoryKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Region'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Continent'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Region'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Continent'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Region'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTerritory', @level2type=N'COLUMN', @level2name=N'Continent'; 
;





/* Drop table dbo.DimSubcategory */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimSubcategory') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimSubcategory 
;

/* Create table dbo.DimSubcategory */
CREATE TABLE dbo.DimSubcategory (
   [ProductSubcategoryKey]  int IDENTITY  NOT NULL
,  [ProductCategoryKey]  nvarchar(5)   NOT NULL
,  [SubcategoryName]  nvarchar(40)   NOT NULL
, CONSTRAINT [PK_dbo.DimSubcategory] PRIMARY KEY CLUSTERED 
( [ProductSubcategoryKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimSubcategory
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimSubcategory', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimSubcategory
;

SET IDENTITY_INSERT dbo.DimSubcategory ON
;
INSERT INTO dbo.DimSubcategory (ProductSubcategoryKey, ProductCategoryKey, SubcategoryName)
VALUES (-1, '', '')
;
SET IDENTITY_INSERT dbo.DimSubcategory OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductSubcategoryKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductCategoryKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'ProductCategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SubcategoryName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'SubcategoryName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'ProductCategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer''s company Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'SubcategoryName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1,2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'ALFKI', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'ProductCategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Bon app', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'SubcategoryName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'ProductCategoryKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'SubcategoryName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'ProductCategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'SubcategoryName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'ProductCategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'SubcategoryName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'ProductCategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSubcategory', @level2type=N'COLUMN', @level2name=N'SubcategoryName'; 
;





/* Drop table dbo.FactReturn */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactReturn') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactReturn 
;

/* Create table dbo.FactReturn */
CREATE TABLE dbo.FactReturn (
   [ReturnKey]  smallint   NOT NULL
,  [ProductKey]  int   NOT NULL
,  [TerritoryKey]  int   NOT NULL
,  [ReturnDate]  int   NOT NULL
,  [ReturnQuantity]  int   NULL
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactReturn
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FactReturn', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactReturn
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ReturnKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ReturnKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TerritoryKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'TerritoryKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ReturnDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ReturnDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ReturnQuantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ReturnQuantity'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Dim1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ReturnKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Dim2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row insertion', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'TerritoryKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row update', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ReturnDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The natural key for the fact table, if any (eg order number)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ReturnQuantity'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ReturnKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'TerritoryKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ReturnDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ReturnKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'TerritoryKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ReturnDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ReturnQuantity'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from Sales.CurrencyRate.FromCurrencyCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ReturnKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from Sales.CurrencyRate.CurrencyRateDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'TerritoryKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReturn', @level2type=N'COLUMN', @level2name=N'ReturnDate'; 
;





/* Drop table dbo.FactSale */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactSale') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactSale 
;

/* Create table dbo.FactSale */
CREATE TABLE dbo.FactSale (
   [ProductKey]  int   NOT NULL
,  [CustomerKey]  int   NOT NULL
,  [TerritoryKey]  int   NOT NULL
,  [OrderLineItem]  int   NOT NULL
,  [OrderQuantity]  int   NULL
,  [ProductPrice]  float   NULL
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactSale
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FactSale', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactSale
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TerritoryKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'TerritoryKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderLineItem', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'OrderLineItem'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderQuantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'OrderQuantity'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'ProductPrice'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Dim1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Dim2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row insertion', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'TerritoryKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row update', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'OrderLineItem'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The natural key for the fact table, if any (eg order number)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'OrderQuantity'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always add a description!', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'ProductPrice'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'TerritoryKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'OrderLineItem'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'TerritoryKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'OrderLineItem'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'OrderQuantity'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts & rates', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'ProductPrice'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from Sales.CurrencyRate.FromCurrencyCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from Sales.CurrencyRate.CurrencyRateDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'TerritoryKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'OrderLineItem'; 
;





/* Drop table dbo.DimProduct */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimProduct') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimProduct 
;

/* Create table dbo.DimProduct */
CREATE TABLE dbo.DimProduct (
   [ProductKey]  int IDENTITY  NOT NULL
,  [ProductSubcategoryKey]  nvarchar(5)   NOT NULL
,  [ProductSKU]  nvarchar(40)   NOT NULL
,  [ProductName]  nvarchar(30)   NULL
,  [ModelName]  nvarchar(30)   NOT NULL
,  [ProductDescription]  nvarchar(15)   NOT NULL
,  [ProductColor]  nvarchar(15)  DEFAULT 'N/A' NOT NULL
,  [ProductSize]  nvarchar(15)   NOT NULL
,  [ProductStyle]  nvarchar(50)   NULL
, CONSTRAINT [PK_dbo.DimProduct] PRIMARY KEY CLUSTERED 
( [ProductKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimProduct
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimProduct', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimProduct
;

SET IDENTITY_INSERT dbo.DimProduct ON
;
INSERT INTO dbo.DimProduct (ProductKey, ProductSubcategoryKey, ProductSKU, ProductName, ModelName, ProductDescription, ProductColor, ProductSize, ProductStyle)
VALUES (-1, '', '', '', '', '', 'NA', '', '')
;
SET IDENTITY_INSERT dbo.DimProduct OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductSubcategoryKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductSKU', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSKU'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ModelName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ModelName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductDescription', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDescription'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductColor', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductColor'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductSize', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSize'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductStyle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductStyle'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer''s company Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSKU'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of contact at the company', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Contact''s job title', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ModelName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Country of origin', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDescription'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'State or province', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductColor'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customers City', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSize'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1,2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'ALFKI', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Bon app', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSKU'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Pedro Alfanso', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Owner, Sales Rep.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ModelName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'USA', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDescription'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'WA', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductColor'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Seattle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSize'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSKU'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ModelName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDescription'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductColor'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSize'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSKU'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ModelName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDescription'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductColor'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSize'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AWP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductStyle'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSKU'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ModelName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDescription'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductColor'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSize'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductStyle'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSKU'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ModelName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDescription'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductColor'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSize'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductStyle'; 
;
ALTER TABLE dbo.FactReturn ADD CONSTRAINT
   FK_dbo_FactReturn_ProductKey FOREIGN KEY
   (
   ProductKey
   ) REFERENCES DimProduct
   ( ProductKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactReturn ADD CONSTRAINT
   FK_dbo_FactReturn_TerritoryKey FOREIGN KEY
   (
   TerritoryKey
   ) REFERENCES DimTerritory
   ( TerritoryKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSale ADD CONSTRAINT
   FK_dbo_FactSale_ProductKey FOREIGN KEY
   (
   ProductKey
   ) REFERENCES DimProduct
   ( ProductKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSale ADD CONSTRAINT
   FK_dbo_FactSale_CustomerKey FOREIGN KEY
   (
   CustomerKey
   ) REFERENCES DimCustomer
   ( CustomerKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSale ADD CONSTRAINT
   FK_dbo_FactSale_TerritoryKey FOREIGN KEY
   (
   TerritoryKey
   ) REFERENCES DimTerritory
   ( TerritoryKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 

-- Create a clean table with the same structure as the raw table
CREATE OR REPLACE TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES AS
SELECT
  CAST(CASE WHEN INVOICEID = 'NULL' THEN NULL ELSE INVOICEID END AS VARCHAR(38)) AS INVOICEID,
  CAST(CASE WHEN CUSTOMERID = 'NULL' THEN NULL ELSE CUSTOMERID END AS VARCHAR(38)) AS CUSTOMERID,
  CAST(CASE WHEN BILLTOCUSTOMERID = 'NULL' THEN NULL ELSE BILLTOCUSTOMERID END AS VARCHAR(38)) AS BILLTOCUSTOMERID,
  CAST(CASE WHEN ORDERID = 'NULL' THEN NULL ELSE ORDERID END AS VARCHAR(38)) AS ORDERID,
  CAST(CASE WHEN DELIVERYMETHODID = 'NULL' THEN NULL ELSE DELIVERYMETHODID END AS VARCHAR(38)) AS DELIVERYMETHODID,
  CAST(CASE WHEN CONTACTPERSONID = 'NULL' THEN NULL ELSE CONTACTPERSONID END AS VARCHAR(38)) AS CONTACTPERSONID,
  CAST(CASE WHEN ACCOUNTSPERSONID = 'NULL' THEN NULL ELSE ACCOUNTSPERSONID END AS VARCHAR(38)) AS ACCOUNTSPERSONID,
  CAST(CASE WHEN SALESPERSONPERSONID = 'NULL' THEN NULL ELSE SALESPERSONPERSONID END AS VARCHAR(38)) AS SALESPERSONPERSONID,
  CAST(CASE WHEN PACKEDBYPERSONID = 'NULL' THEN NULL ELSE PACKEDBYPERSONID END AS VARCHAR(38)) AS PACKEDBYPERSONID,
  CAST(CASE WHEN INVOICEDATE = 'NULL' THEN NULL ELSE INVOICEDATE END AS VARCHAR(20)) AS INVOICEDATE,
  CAST(CASE WHEN CUSTOMERPURCHASEORDERNUMBER = 'NULL' THEN NULL ELSE CUSTOMERPURCHASEORDERNUMBER END AS VARCHAR(20)) AS CUSTOMERPURCHASEORDERNUMBER,
  CAST(CASE WHEN TOTALDRYITEMS = 'NULL' THEN NULL ELSE TOTALDRYITEMS END AS VARCHAR(38)) AS TOTALDRYITEMS,
  CAST(CASE WHEN TOTALCHILLERITEMS = 'NULL' THEN NULL ELSE TOTALCHILLERITEMS END AS VARCHAR(38)) AS TOTALCHILLERITEMS,
  CAST(CASE WHEN CONFIRMEDDELIVERYTIME = 'NULL' THEN NULL ELSE CONFIRMEDDELIVERYTIME END AS VARCHAR(25)) AS CONFIRMEDDELIVERYTIME,
  CAST(CASE WHEN CONFIRMEDRECEIVEDBY = 'NULL' THEN NULL ELSE CONFIRMEDRECEIVEDBY END AS VARCHAR(4000)) AS CONFIRMEDRECEIVEDBY
FROM KN_LOGISTICS.SNOWSQL.SALES_INVOICES_RAW;

SELECT *
FROM KN_LOGISTICS.SNOWSQL.SALES_INVOICES;


------------------------------------
--Converting of datatypes
------------------------------------
---------------------INVOICEID------------------------
-- Convert INVOICEID to NUMBER(38,0)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD COLUMN INVOICEID_NUM NUMBER(38,0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
SET INVOICEID_NUM = CAST(INVOICEID AS NUMBER(38,0));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
DROP COLUMN INVOICEID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
RENAME COLUMN INVOICEID_NUM TO INVOICEID;

---------------------CUSTOMERID------------------------
-- Convert CUSTOMERID to NUMBER(38,0)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD COLUMN CUSTOMERID_NUM NUMBER(38,0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
SET CUSTOMERID_NUM = CAST(CUSTOMERID AS NUMBER(38,0));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
DROP COLUMN CUSTOMERID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
RENAME COLUMN CUSTOMERID_NUM TO CUSTOMERID;

---------------------BILLTOCUSTOMERID------------------------
-- Convert BILLTOCUSTOMERID to NUMBER(38,0)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD COLUMN BILLTOCUSTOMERID_NUM NUMBER(38,0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
SET BILLTOCUSTOMERID_NUM = CAST(BILLTOCUSTOMERID AS NUMBER(38,0));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
DROP COLUMN BILLTOCUSTOMERID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
RENAME COLUMN BILLTOCUSTOMERID_NUM TO BILLTOCUSTOMERID;

---------------------ORDERID------------------------
-- Convert ORDERID to NUMBER(38,0)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD COLUMN ORDERID_NUM NUMBER(38,0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
SET ORDERID_NUM = CAST(ORDERID AS NUMBER(38,0));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
DROP COLUMN ORDERID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
RENAME COLUMN ORDERID_NUM TO ORDERID;

---------------------DELIVERYMETHODID------------------------
-- Convert DELIVERYMETHODID to NUMBER(38,0)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD COLUMN DELIVERYMETHODID_NUM NUMBER(38,0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
SET DELIVERYMETHODID_NUM = CAST(DELIVERYMETHODID AS NUMBER(38,0));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
DROP COLUMN DELIVERYMETHODID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
RENAME COLUMN DELIVERYMETHODID_NUM TO DELIVERYMETHODID;

---------------------CONTACTPERSONID------------------------
-- Convert CONTACTPERSONID to NUMBER(38,0)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD COLUMN CONTACTPERSONID_NUM NUMBER(38,0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
SET CONTACTPERSONID_NUM = CAST(CONTACTPERSONID AS NUMBER(38,0));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
DROP COLUMN CONTACTPERSONID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
RENAME COLUMN CONTACTPERSONID_NUM TO CONTACTPERSONID;

---------------------ACCOUNTSPERSONID------------------------
-- Convert ACCOUNTSPERSONID to NUMBER(38,0)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD COLUMN ACCOUNTSPERSONID_NUM NUMBER(38,0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
SET ACCOUNTSPERSONID_NUM = CAST(ACCOUNTSPERSONID AS NUMBER(38,0));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
DROP COLUMN ACCOUNTSPERSONID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
RENAME COLUMN ACCOUNTSPERSONID_NUM TO ACCOUNTSPERSONID;

---------------------SALESPERSONPERSONID------------------------
-- Convert SALESPERSONPERSONID to NUMBER(38,0)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD COLUMN SALESPERSONPERSONID_NUM NUMBER(38,0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
SET SALESPERSONPERSONID_NUM = CAST(SALESPERSONPERSONID AS NUMBER(38,0));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
DROP COLUMN SALESPERSONPERSONID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
RENAME COLUMN SALESPERSONPERSONID_NUM TO SALESPERSONPERSONID;

---------------------PACKEDBYPERSONID------------------------
-- Convert PACKEDBYPERSONID to NUMBER(38,0)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD COLUMN PACKEDBYPERSONID_NUM NUMBER(38,0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
SET PACKEDBYPERSONID_NUM = CAST(PACKEDBYPERSONID AS NUMBER(38,0));


ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
DROP COLUMN PACKEDBYPERSONID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
RENAME COLUMN PACKEDBYPERSONID_NUM TO PACKEDBYPERSONID;

---------------------TOTALDRYITEMS------------------------
-- Convert TOTALDRYITEMS to NUMBER(38,0)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD COLUMN TOTALDRYITEMS_NUM NUMBER(38,0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
SET TOTALDRYITEMS_NUM = CAST(TOTALDRYITEMS AS NUMBER(38,0));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
DROP COLUMN TOTALDRYITEMS;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
RENAME COLUMN TOTALDRYITEMS_NUM TO TOTALDRYITEMS;

---------------------TOTALCHILLERITEMS------------------------
-- Convert TOTALCHILLERITEMS to NUMBER(38,0)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD COLUMN TOTALCHILLERITEMS_NUM NUMBER(38,0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
SET TOTALCHILLERITEMS_NUM = CAST(TOTALCHILLERITEMS AS NUMBER(38,0));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
DROP COLUMN TOTALCHILLERITEMS;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
RENAME COLUMN TOTALCHILLERITEMS_NUM TO TOTALCHILLERITEMS;

---------------------INVOICEDATE------------------------
-- Add a new column with DATE data type
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD COLUMN INVOICEDATE_DATE DATE;

-- Populate the new column with converted values using TO_DATE with the correct format
UPDATE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
SET INVOICEDATE_DATE = TO_DATE(INVOICEDATE, 'DD/MM/YYYY');

-- Drop the old INVOICEDATE column
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
DROP COLUMN INVOICEDATE;

-- Rename the new column to the original column name
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
RENAME COLUMN INVOICEDATE_DATE TO INVOICEDATE;


------------------CONFIRMEDDELIVERYTIME----------------

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD COLUMN CONFIRMEDDELIVERYTIME_DATE TIMESTAMP;

// Change to date format for ORDERDATE column
UPDATE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
SET CONFIRMEDDELIVERYTIME_DATE = TO_TIMESTAMP(CONFIRMEDDELIVERYTIME, 'DD/MM/YYYY HH24:MI');

SELECT CONFIRMEDDELIVERYTIME, CONFIRMEDDELIVERYTIME_DATE
FROM KN_LOGISTICS.SNOWSQL.SALES_INVOICES;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
DROP COLUMN CONFIRMEDDELIVERYTIME;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
RENAME COLUMN CONFIRMEDDELIVERYTIME_DATE TO CONFIRMEDDELIVERYTIME;

// Check 10 rows of TRANSACTIONOCCURREDWHEN after updating the data type
SELECT CONFIRMEDDELIVERYTIME FROM KN_LOGISTICS.SNOWSQL.SALES_INVOICES LIMIT 10;

// Check 10 rows of the whole table after updating the data type
SELECT * FROM KN_LOGISTICS.SNOWSQL.SALES_INVOICES LIMIT 10;

-------------------------------------
--Adding primary key to table
-------------------------------------
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD CONSTRAINT PK_SALES_INVOICES_INVOICEID
PRIMARY KEY (INVOICEID);

------------------------------------------------------
--ERROR HANDLING
------------------------------------------------------
WITH CTE AS (
    SELECT 
        INVOICEID,
        CUSTOMERID, 
        BILLTOCUSTOMERID, 
        ORDERID, 
        DELIVERYMETHODID, 
        CONTACTPERSONID, 
        ACCOUNTSPERSONID, 
        SALESPERSONPERSONID, 
        PACKEDBYPERSONID, 
        INVOICEDATE, 
        CUSTOMERPURCHASEORDERNUMBER, 
        TOTALDRYITEMS, 
        TOTALCHILLERITEMS, 
        CONFIRMEDDELIVERYTIME, 
        CONFIRMEDRECEIVEDBY,
        LAG(INVOICEID) OVER (ORDER BY INVOICEID) AS prev_invoiceid,
        ROW_NUMBER() OVER (ORDER BY INVOICEID) AS row_num
    FROM KN_LOGISTICS.SNOWSQL.SALES_INVOICES
)
SELECT  
        CUSTOMERID, 
        BILLTOCUSTOMERID, 
        ORDERID, 
        DELIVERYMETHODID, 
        CONTACTPERSONID, 
        ACCOUNTSPERSONID, 
        SALESPERSONPERSONID, 
        PACKEDBYPERSONID, 
        INVOICEDATE, 
        CUSTOMERPURCHASEORDERNUMBER, 
        TOTALDRYITEMS, 
        TOTALCHILLERITEMS, 
        CONFIRMEDDELIVERYTIME, 
        CONFIRMEDRECEIVEDBY,
    CASE
        WHEN INVOICEID IS NULL THEN prev_invoiceid + 1
        ELSE INVOICEID
    END AS INVOICEID
FROM CTE
ORDER BY row_num;


-------------------------------------------------------
--Adding of foreign key to table
-------------------------------------------------------

-- Foreign Key: Sales.Invoices.CustomerID -> Sales.Customers.CustomerID
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD CONSTRAINT FK_Sales_Invoices_CustomerID_Sales_Customers
FOREIGN KEY (CustomerID)
REFERENCES KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERS(CustomerID);

-- Foreign Key: Sales.Invoices.BillToCustomerID -> Sales.Customers.CustomerID
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD CONSTRAINT FK_Sales_Invoices_BillToCustomerID_Sales_Customers
FOREIGN KEY (BillToCustomerID)
REFERENCES KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERS(CustomerID);

-- Foreign Key: Sales.Invoices.OrderID -> Sales.Orders.OrderID
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD CONSTRAINT FK_Sales_Invoices_OrderID_Sales_Orders
FOREIGN KEY (OrderID)
REFERENCES KN_LOGISTICS.SNOWSQL.SALES_ORDERS(OrderID);

-- Foreign Key: Sales.Invoices.DeliveryMethodID -> Application.DeliveryMethods.DeliveryMethodID
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD CONSTRAINT FK_Sales_Invoices_DeliveryMethodID_Application_DeliveryMethods
FOREIGN KEY (DeliveryMethodID)
REFERENCES KN_LOGISTICS.SNOWSQL.APPLICATION_DELIVERYMETHODS(DeliveryMethodID);

-- Foreign Key: Sales.Invoices.ContactPersonID -> Application.People.PersonID
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD CONSTRAINT FK_Sales_Invoices_ContactPersonID_Application_People
FOREIGN KEY (ContactPersonID)
REFERENCES KN_LOGISTICS.SNOWSQL.APPLICATION_PEOPLE(PersonID);

-- Foreign Key: Sales.Invoices.AccountsPersonID -> Application.People.PersonID
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD CONSTRAINT FK_Sales_Invoices_AccountsPersonID_Application_People
FOREIGN KEY (AccountsPersonID)
REFERENCES KN_LOGISTICS.SNOWSQL.APPLICATION_PEOPLE(PersonID);

-- Foreign Key: Sales.Invoices.SalespersonPersonID -> Application.People.PersonID
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD CONSTRAINT FK_Sales_Invoices_SalespersonPersonID_Application_People
FOREIGN KEY (SalespersonPersonID)
REFERENCES KN_LOGISTICS.SNOWSQL.APPLICATION_PEOPLE(PersonID);

-- Foreign Key: Sales.Invoices.PackedByPersonID -> Application.People.PersonID
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_INVOICES
ADD CONSTRAINT FK_Sales_Invoices_PackedByPersonID_Application_People
FOREIGN KEY (PackedByPersonID)
REFERENCES KN_LOGISTICS.SNOWSQL.APPLICATION_PEOPLE(PersonID);

SELECT * FROM SALES_INVOICES LIMIT 20


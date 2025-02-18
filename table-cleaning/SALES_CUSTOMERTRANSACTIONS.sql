CREATE OR REPLACE TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS AS
SELECT
  CAST(CASE WHEN CUSTOMERTRANSACTIONID = 'NULL' THEN NULL ELSE CUSTOMERTRANSACTIONID END AS VARCHAR(38)) AS CUSTOMERTRANSACTIONID,
  CAST(CASE WHEN CUSTOMERID = 'NULL' THEN NULL ELSE CUSTOMERID END AS VARCHAR(38)) AS CUSTOMERID,
  CAST(CASE WHEN TRANSACTIONTYPEID = 'NULL' THEN NULL ELSE TRANSACTIONTYPEID END AS VARCHAR(38)) AS TRANSACTIONTYPEID,
  CAST(CASE WHEN INVOICEID = 'NULL' THEN NULL ELSE INVOICEID END AS VARCHAR(38)) AS INVOICEID,
  CAST(CASE WHEN PAYMENTMETHODID = 'NULL' THEN NULL ELSE PAYMENTMETHODID END AS VARCHAR(38)) AS PAYMENTMETHODID,
  CAST(CASE WHEN TRANSACTIONDATE = 'NULL' THEN NULL ELSE TRANSACTIONDATE END AS VARCHAR(20)) AS TRANSACTIONDATE,
  CAST(CASE WHEN AMOUNTEXCLUDINGTAX = 'NULL' THEN NULL ELSE AMOUNTEXCLUDINGTAX END AS VARCHAR(38)) AS AMOUNTEXCLUDINGTAX,
  CAST(CASE WHEN TAXAMOUNT = 'NULL' THEN NULL ELSE TAXAMOUNT END AS VARCHAR(38)) AS TAXAMOUNT,
  CAST(CASE WHEN TRANSACTIONAMOUNT = 'NULL' THEN NULL ELSE TRANSACTIONAMOUNT END AS VARCHAR(38)) AS TRANSACTIONAMOUNT,
  CAST(CASE WHEN OUTSTANDINGBALANCE = 'NULL' THEN NULL ELSE OUTSTANDINGBALANCE END AS VARCHAR(38)) AS OUTSTANDINGBALANCE,
  CAST(CASE WHEN FINALIZATIONDATE = 'NULL' THEN NULL ELSE FINALIZATIONDATE END AS VARCHAR(20)) AS FINALIZATIONDATE,
  CAST(CASE WHEN ISFINALIZED = 'NULL' THEN NULL ELSE ISFINALIZED END AS VARCHAR(38)) AS ISFINALIZED
FROM KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS_RAW;

------------------------------------
--Converting of datatypes
------------------------------------
-- Convert CUSTOMERTRANSACTIONID to NUMBER(38,0)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
ADD COLUMN CUSTOMERTRANSACTIONID_NUM NUMBER(38, 0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
SET CUSTOMERTRANSACTIONID_NUM = CAST(CUSTOMERTRANSACTIONID AS NUMBER(38, 0));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
DROP COLUMN CUSTOMERTRANSACTIONID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
RENAME COLUMN CUSTOMERTRANSACTIONID_NUM TO CUSTOMERTRANSACTIONID;

-- Convert CUSTOMERID to NUMBER(38,0)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
ADD COLUMN CUSTOMERID_NUM NUMBER(38, 0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
SET CUSTOMERID_NUM = CAST(CUSTOMERID AS NUMBER(38, 0));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
DROP COLUMN CUSTOMERID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
RENAME COLUMN CUSTOMERID_NUM TO CUSTOMERID;

-- Convert TRANSACTIONTYPEID to NUMBER(38,0)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
ADD COLUMN TRANSACTIONTYPEID_NUM NUMBER(38, 0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
SET TRANSACTIONTYPEID_NUM = CAST(TRANSACTIONTYPEID AS NUMBER(38, 0));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
DROP COLUMN TRANSACTIONTYPEID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
RENAME COLUMN TRANSACTIONTYPEID_NUM TO TRANSACTIONTYPEID;

-- Convert INVOICEID to NUMBER(38,0)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
ADD COLUMN INVOICEID_NUM NUMBER(38, 0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
SET INVOICEID_NUM = CAST(INVOICEID AS NUMBER(38, 0));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
DROP COLUMN INVOICEID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
RENAME COLUMN INVOICEID_NUM TO INVOICEID;

-- Convert PAYMENTMETHODID to NUMBER(38,0)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
ADD COLUMN PAYMENTMETHODID_NUM NUMBER(38, 0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
SET PAYMENTMETHODID_NUM = CAST(PAYMENTMETHODID AS NUMBER(38, 0));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
DROP COLUMN PAYMENTMETHODID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
RENAME COLUMN PAYMENTMETHODID_NUM TO PAYMENTMETHODID;

-- Convert TRANSACTIONDATE to DATE
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
ADD COLUMN TRANSACTIONDATE_DATE DATE;

UPDATE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
SET TRANSACTIONDATE_DATE = TO_DATE(TRANSACTIONDATE, 'DD/MM/YYYY');

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
DROP COLUMN TRANSACTIONDATE;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
RENAME COLUMN TRANSACTIONDATE_DATE TO TRANSACTIONDATE;

-- Convert AMOUNTEXCLUDINGTAX to DECIMAL(18,2)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
ADD COLUMN AMOUNTEXCLUDINGTAX_DEC DECIMAL(18, 2);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
SET AMOUNTEXCLUDINGTAX_DEC = CAST(AMOUNTEXCLUDINGTAX AS DECIMAL(18, 2));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
DROP COLUMN AMOUNTEXCLUDINGTAX;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
RENAME COLUMN AMOUNTEXCLUDINGTAX_DEC TO AMOUNTEXCLUDINGTAX;

-- Convert TAXAMOUNT to DECIMAL(18,2)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
ADD COLUMN TAXAMOUNT_DEC DECIMAL(18, 2);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
SET TAXAMOUNT_DEC = CAST(TAXAMOUNT AS DECIMAL(18, 2));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
DROP COLUMN TAXAMOUNT;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
RENAME COLUMN TAXAMOUNT_DEC TO TAXAMOUNT;

-- Convert TRANSACTIONAMOUNT to DECIMAL(18,2)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
ADD COLUMN TRANSACTIONAMOUNT_DEC DECIMAL(18, 2);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
SET TRANSACTIONAMOUNT_DEC = CAST(TRANSACTIONAMOUNT AS DECIMAL(18, 2));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
DROP COLUMN TRANSACTIONAMOUNT;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
RENAME COLUMN TRANSACTIONAMOUNT_DEC TO TRANSACTIONAMOUNT;

-- Convert OUTSTANDINGBALANCE to DECIMAL(18,2)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
ADD COLUMN OUTSTANDINGBALANCE_DEC DECIMAL(18, 2);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
SET OUTSTANDINGBALANCE_DEC = CAST(OUTSTANDINGBALANCE AS DECIMAL(18, 2));

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
DROP COLUMN OUTSTANDINGBALANCE;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
RENAME COLUMN OUTSTANDINGBALANCE_DEC TO OUTSTANDINGBALANCE;

-- Convert FINALIZATIONDATE to DATE
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
ADD COLUMN FINALIZATIONDATE_DATE DATE;

-- Step 2: Convert and populate the new column using TO_DATE
UPDATE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
SET FINALIZATIONDATE_DATE = TO_DATE(FINALIZATIONDATE, 'DD/MM/YYYY');

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
DROP COLUMN FINALIZATIONDATE;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
RENAME COLUMN FINALIZATIONDATE_DATE TO FINALIZATIONDATE;

-- Convert ISFINALIZED to BOOLEAN
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
ADD COLUMN ISFINALIZED_BOOL BOOLEAN;

UPDATE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
SET ISFINALIZED_BOOL = 
    CASE 
        WHEN ISFINALIZED = '1' THEN TRUE
        WHEN ISFINALIZED = '0' THEN FALSE
        ELSE NULL
    END;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
DROP COLUMN ISFINALIZED;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
RENAME COLUMN ISFINALIZED_BOOL TO ISFINALIZED;


---------------------------------------
--Adding primary key to table
---------------------------------------
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
ADD CONSTRAINT PK_SALES_CUSTOMERTRANSACTIONS_CUSTOMERTRANSACTIONID
PRIMARY KEY (CUSTOMERTRANSACTIONID);


-----------------------------------------
--ERROR HANDLING
-----------------------------------------
WITH CTE AS (
    SELECT 
        CUSTOMERTRANSACTIONID,
        CUSTOMERID,
        TRANSACTIONTYPEID,
        INVOICEID,
        PAYMENTMETHODID,
        TRANSACTIONDATE,
        AMOUNTEXCLUDINGTAX,
        TAXAMOUNT,
        TRANSACTIONAMOUNT,
        OUTSTANDINGBALANCE,
        FINALIZATIONDATE,
        ISFINALIZED,
        LAG(CUSTOMERTRANSACTIONID) OVER (ORDER BY CUSTOMERTRANSACTIONID) AS prev_customertransactionid,
        ROW_NUMBER() OVER (ORDER BY CUSTOMERTRANSACTIONID) AS row_num
    FROM KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
)
SELECT 
    CUSTOMERID,
    TRANSACTIONTYPEID,
    INVOICEID,
    PAYMENTMETHODID,
    TRANSACTIONDATE,
    AMOUNTEXCLUDINGTAX,
    TAXAMOUNT,
    TRANSACTIONAMOUNT,
    OUTSTANDINGBALANCE,
    FINALIZATIONDATE,
    ISFINALIZED,
    CASE
        WHEN CUSTOMERTRANSACTIONID IS NULL THEN prev_customertransactionid + 1
        ELSE CUSTOMERTRANSACTIONID
    END AS CUSTOMERTRANSACTIONID
FROM CTE
ORDER BY row_num;

-------------------------------------
--Adding of foreign keys
-------------------------------------
-- Add Foreign Key: CUSTOMERID -> Sales.Customers.CustomerID
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
ADD CONSTRAINT FK_SALES_CUSTOMERTRANSACTIONS_CUSTOMERID_SALES_CUSTOMERS
FOREIGN KEY (CustomerID)
REFERENCES KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERS(CustomerID);

-- Add Foreign Key: TRANSACTIONTYPEID -> Application.TransactionTypes.TransactionTypeID
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
ADD CONSTRAINT FK_SALES_CUSTOMERTRANSACTIONS_TRANSACTIONTYPEID_APPLICATION_TRANSACTIONTYPES
FOREIGN KEY (TransactionTypeID)
REFERENCES KN_LOGISTICS.SNOWSQL.APPLICATION_TRANSACTIONTYPES(TransactionTypeID);

-- Add Foreign Key: INVOICEID -> Sales.Invoices.InvoiceID
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
ADD CONSTRAINT FK_SALES_CUSTOMERTRANSACTIONS_INVOICEID_SALES_INVOICES
FOREIGN KEY (InvoiceID)
REFERENCES KN_LOGISTICS.SNOWSQL.SALES_INVOICES(InvoiceID);

-- Add Foreign Key: PAYMENTMETHODID -> Application.PaymentMethods.PaymentMethodID
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS
ADD CONSTRAINT FK_SALES_CUSTOMERTRANSACTIONS_PAYMENTMETHODID_APPLICATION_PAYMENTMETHODS
FOREIGN KEY (PaymentMethodID)
REFERENCES KN_LOGISTICS.SNOWSQL.APPLICATION_PAYMENTMETHODS(PaymentMethodID);

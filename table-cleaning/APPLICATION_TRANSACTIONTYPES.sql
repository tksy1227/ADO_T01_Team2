create or replace TABLE KN_LOGISTICS.SNOWSQL.APPLICATION_TRANSACTIONTYPES (
	TRANSACTIONTYPEID NUMBER(38,0) NOT NULL,
	TRANSACTIONTYPENAME VARCHAR(50),
	constraint UK_APPLICATION_TRANSACTIONTYPES_TRANSACTIONTYPENAME unique (TRANSACTIONTYPENAME),
	constraint PK_APPLICATION_TRANSACTIONTYPES primary key (TRANSACTIONTYPEID)
);

ALTER TABLE KN_LOGISTICS.SNOWSQL.APPLICATION_TRANSACTIONTYPES
ADD CONSTRAINT PK_APPLICATION_TRANSACTIONTYPES_TRANSACTIONTYPEID
PRIMARY KEY (TRANSACTIONTYPEID);

-----------------------------------------------------------------------------------------
// Null string value "NULL" checks for all columns (only varchar data type columns) 
-----------------------------------------------------------------------------------------
SELECT
    SUM(CASE WHEN TRANSACTIONTYPENAME = 'NULL' THEN 1 ELSE 0 END) AS NULL_COUNT_TRANSACTIONTYPENAME
FROM KN_LOGISTICS.SNOWSQL.APPLICATION_TRANSACTIONTYPES;

-----------------------------------------------------------------------------------------
// Null value checks for actual null values
-----------------------------------------------------------------------------------------
SELECT 
    COUNT(CASE WHEN TRANSACTIONTYPEID IS NULL THEN 1 END) AS COUNT_TRANSACTIONTYPEID_NULL,
    COUNT(CASE WHEN TRANSACTIONTYPENAME IS NULL THEN 1 END) AS COUNT_TRANSACTIONTYPENAME_NULL
FROM KN_LOGISTICS.SNOWSQL.APPLICATION_TRANSACTIONTYPES;


-----------------------------------------------------------------------------------------
// convert "NULL" string values into actual null values (DONT RUN YET)
-----------------------------------------------------------------------------------------
UPDATE KN_LOGISTICS.SNOWSQL.APPLICATION_TRANSACTIONTYPES
SET TRANSACTIONTYPEID = NULL
WHERE TRANSACTIONTYPEID = 'NULL';

UPDATE KN_LOGISTICS.SNOWSQL.APPLICATION_TRANSACTIONTYPES
SET TRANSACTIONTYPENAME = NULL
WHERE TRANSACTIONTYPENAME = 'NULL';

-----------------------------------------------------------------------------------------
//check for duplicates
-----------------------------------------------------------------------------------------
SELECT TRANSACTIONTYPEID, TRANSACTIONTYPENAME, COUNT(*) AS DUPLICATE_COUNT
FROM KN_LOGISTICS.SNOWSQL.APPLICATION_TRANSACTIONTYPES
GROUP BY TRANSACTIONTYPEID, TRANSACTIONTYPENAME
HAVING COUNT(*) > 1;

-----------------------------------------------------------------------------------------
// validate foreign keys with JOINS
-----------------------------------------------------------------------------------------
SELECT DISTINCT s.COUNTRYID
FROM KN_LOGISTICS.SNOWSQL.APPLICATION_STATEPROVINCES s
LEFT JOIN KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA c
    ON s.COUNTRYID = c.COUNTRYID
WHERE c.COUNTRYID IS NULL;


---------------------------------------------
// data type conversion (to number): TRANSACTIONTYPEID
---------------------------------------------
// TRANSACTIONTYPEID
ALTER TABLE KN_LOGISTICS.SNOWSQL.APPLICATION_TRANSACTIONTYPES
ADD COLUMN TRANSACTIONTYPEID_NUM NUMBER(38,0);

UPDATE KN_LOGISTICS.SNOWSQL.APPLICATION_TRANSACTIONTYPES
SET TRANSACTIONTYPEID_NUM = TO_NUMBER(TRANSACTIONTYPEID);

SELECT TRANSACTIONTYPEID, TRANSACTIONTYPEID_NUM
FROM KN_LOGISTICS.SNOWSQL.APPLICATION_TRANSACTIONTYPES;

ALTER TABLE KN_LOGISTICS.SNOWSQL.APPLICATION_TRANSACTIONTYPES
DROP COLUMN TRANSACTIONTYPEID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.APPLICATION_TRANSACTIONTYPES
RENAME COLUMN TRANSACTIONTYPEID_NUM TO TRANSACTIONTYPEID;
// Check 10 rows of SUPPLIERID after updating the data type
SELECT TRANSACTIONTYPEID FROM KN_LOGISTICS.SNOWSQL.APPLICATION_TRANSACTIONTYPES LIMIT 10;

// Check 10 rows of the whole table after updating the data type
SELECT * FROM KN_LOGISTICS.SNOWSQL.APPLICATION_TRANSACTIONTYPES;

--------------------------------------------------
// data type conversion (to timestamp)
--------------------------------------------------
// no need

--------------------------------------------------
// data type conversion (to date)
--------------------------------------------------
// no need

--------------------------------------------------
// data type conversion (to boolean)
--------------------------------------------------
// no need


create or replace TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERCATEGORIES (
	CUSTOMERCATEGORYID NUMBER(38,0) NOT NULL,
	CUSTOMERCATEGORYNAME VARCHAR(50),
	constraint UK_SALES_CUSTOMERCATEGORIES_CUSTOMERCATEGORYNAME unique (CUSTOMERCATEGORYNAME),
	constraint PK_SALES_CUSTOMERCATEGORIES primary key (CUSTOMERCATEGORYID)
);

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERCATEGORIES
ADD CONSTRAINT PK_SALES_CUSTOMERCATEGORIES_CUSTOMERCATEGORYID
PRIMARY KEY (CUSTOMERCATEGORYID);

-----------------------------------------------------------------------------------------
// Null string value "NULL" checks for all columns (only varchar data type columns) 
-----------------------------------------------------------------------------------------
SELECT
    SUM(CASE WHEN CUSTOMERCATEGORYNAME = 'NULL' THEN 1 ELSE 0 END) AS NULL_COUNT_CUSTOMERCATEGORYNAME
FROM KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERCATEGORIES;

-----------------------------------------------------------------------------------------
// Null value checks for actual null values
-----------------------------------------------------------------------------------------
SELECT 
    COUNT(CASE WHEN CUSTOMERCATEGORYID IS NULL THEN 1 END) AS COUNT_CUSTOMERCATEGORYID_NULL,
    COUNT(CASE WHEN CUSTOMERCATEGORYNAME IS NULL THEN 1 END) AS COUNT_CUSTOMERCATEGORYNAME_NULL
FROM KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERCATEGORIES;


-----------------------------------------------------------------------------------------
// convert "NULL" string values into actual null values (DONT RUN YET)
-----------------------------------------------------------------------------------------
UPDATE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERCATEGORIES
SET CUSTOMERCATEGORYID = NULL
WHERE CUSTOMERCATEGORYID = 'NULL';

UPDATE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERCATEGORIES
SET CUSTOMERCATEGORYNAME = NULL
WHERE CUSTOMERCATEGORYNAME = 'NULL';

-----------------------------------------------------------------------------------------
//check for duplicates
-----------------------------------------------------------------------------------------
SELECT CUSTOMERCATEGORYID, CUSTOMERCATEGORYNAME, COUNT(*) AS DUPLICATE_COUNT
FROM KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERCATEGORIES
GROUP BY CUSTOMERCATEGORYID, CUSTOMERCATEGORYNAME
HAVING COUNT(*) > 1;

-----------------------------------------------------------------------------------------
// validate foreign keys with JOINS
-----------------------------------------------------------------------------------------
// no need


---------------------------------------------
// data type conversion (to number): CUSTOMERCATEGORYID
---------------------------------------------
// CUSTOMERCATEGORYID
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERCATEGORIES
ADD COLUMN CUSTOMERCATEGORYID_NUM NUMBER(38,0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERCATEGORIES
SET CUSTOMERCATEGORYID_NUM = TO_NUMBER(CUSTOMERCATEGORYID);

SELECT CUSTOMERCATEGORYID, CUSTOMERCATEGORYID_NUM
FROM KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERCATEGORIES;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERCATEGORIES
DROP COLUMN CUSTOMERCATEGORYID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERCATEGORIES
RENAME COLUMN CUSTOMERCATEGORYID_NUM TO CUSTOMERCATEGORYID;
// Check 10 rows of SUPPLIERID after updating the data type
SELECT CUSTOMERCATEGORYID FROM KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERCATEGORIES LIMIT 10;

// Check 10 rows of the whole table after updating the data type
SELECT * FROM KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERCATEGORIES;

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


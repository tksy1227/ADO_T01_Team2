
-- Step 1: Null String Value "NULL" Checks for All Columns
SELECT
    SUM(CASE WHEN BUYINGGROUPID = 'NULL' THEN 1 ELSE 0 END) AS NULL_COUNT_BUYINGGROUPID,
    SUM(CASE WHEN BUYINGGROUPNAME = 'NULL' THEN 1 ELSE 0 END) AS NULL_COUNT_BUYINGGROUPNAME
FROM KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS_RAW;

-- Step 2: Null Value Checks for Actual NULL Values
SELECT 
    COUNT(CASE WHEN BUYINGGROUPID IS NULL THEN 1 END) AS count_BUYINGGROUPID_NULL,
    COUNT(CASE WHEN BUYINGGROUPNAME IS NULL THEN 1 END) AS count_BUYINGGROUPNAME_NULL
FROM KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS_RAW;

-- Step 3: Convert "NULL" String Values into Actual NULL Values
UPDATE KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS_RAW
SET BUYINGGROUPID = NULL
WHERE BUYINGGROUPID = 'NULL';

UPDATE KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS_RAW
SET BUYINGGROUPNAME = NULL
WHERE BUYINGGROUPNAME = 'NULL';

-- Step 4: Check for Duplicates
SELECT BUYINGGROUPID, COUNT(*) AS count
FROM KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS_RAW
GROUP BY BUYINGGROUPID
HAVING COUNT(*) > 1;

-- Step 5: Validate Foreign Keys with JOINS
-- (Skipped as this table does not contain foreign keys)

-- Step 6: Data Type Conversion (to Number)
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS_RAW
ADD COLUMN BUYINGGROUPID_NUM NUMBER(38,0);

UPDATE KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS_RAW
SET BUYINGGROUPID_NUM = TO_NUMBER(BUYINGGROUPID);

SELECT BUYINGGROUPID, BUYINGGROUPID_NUM
FROM KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS_RAW;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS_RAW
DROP COLUMN BUYINGGROUPID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS_RAW
RENAME COLUMN BUYINGGROUPID_NUM TO BUYINGGROUPID;

-- Step 7: Check Rows After Updates
-- Check 10 Rows of BUYINGGROUPID
SELECT BUYINGGROUPID 
FROM KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS_RAW 
LIMIT 10;

-- Check 10 Rows of the Whole Table
SELECT * 
FROM KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS_RAW 
LIMIT 10;

-- Check the Number of Rows for a Specific BUYINGGROUPID
SELECT COUNT(*) AS row_count
FROM KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS_RAW
WHERE BUYINGGROUPID = 'ExampleID';


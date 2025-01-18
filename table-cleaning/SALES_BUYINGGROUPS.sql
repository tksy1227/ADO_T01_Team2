-- Create a clean table with the same structure as the raw table
CREATE OR REPLACE TABLE KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS AS
SELECT
  CAST(CASE WHEN BUYINGGROUPID = 'NULL' THEN NULL ELSE BUYINGGROUPID END AS VARCHAR(38)) AS BUYINGGROUPID,
  CAST(CASE WHEN BUYINGGROUPNAME = 'NULL' THEN NULL ELSE BUYINGGROUPNAME END AS VARCHAR(50)) AS BUYINGGROUPNAME
FROM KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS_RAW;


-- Verify the clean table
SELECT *
FROM KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS;

----------------------------------------
--Converting of datatype
----------------------------------------

---------------------BUYINGGROUPID------------------------
-- Step 1: Add a new column with DECIMAL data type
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS
ADD COLUMN BUYINGGROUPID_NUMBER NUMBER(38,0);

-- Step 2: Populate the new column with converted values
UPDATE KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS
SET BUYINGGROUPID_NUMBER = CAST(BUYINGGROUPID AS NUMBER(38,0));

-- Step 3: Verify the conversion
SELECT BUYINGGROUPID_NUMBER, BUYINGGROUPID
FROM KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS
LIMIT 10;

-- Step 4: Drop the old column
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS
DROP COLUMN BUYINGGROUPID;

-- Step 5: Rename the new column to the original column name
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS
RENAME COLUMN BUYINGGROUPID_NUMBER TO BUYINGGROUPID;

-------------------------------------
--Adding of primary key to table
-------------------------------------
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS
ADD CONSTRAINT PK_SALES_BUYINGGROUPS_BUYINGGROUPID
PRIMARY KEY (BUYINGGROUPID);


-------------------------------------
--Adding of unique key to table
-------------------------------------
ALTER TABLE KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS
ADD CONSTRAINT UK_SALES_BUYINGGROUPS_BUYINGGROUPNAME
UNIQUE (BUYINGGROUPNAME);


-------------------------------------------------------
--ERROR HANDLING
-------------------------------------------------------
WITH CTE AS (
    SELECT 
        BUYINGGROUPID,
        BUYINGGROUPNAME,
        LAG(BUYINGGROUPID) OVER (ORDER BY BUYINGGROUPID) AS prev_buyinggroupid,
        ROW_NUMBER() OVER (ORDER BY BUYINGGROUPID) AS row_num
    FROM KN_LOGISTICS.SNOWSQL.SALES_BUYINGGROUPS
)
SELECT
    BUYINGGROUPNAME,
    CASE
        WHEN BUYINGGROUPID IS NULL THEN prev_buyinggroupid + 1
        ELSE BUYINGGROUPID
    END AS BUYINGGROUPID

FROM CTE
ORDER BY row_num;

-------------------------------------------------------
--Adding of foreign key to table
-------------------------------------------------------
-- THERE ARE NO FOREIGN KEYS IN THIS TABLE


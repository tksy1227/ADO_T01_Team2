-- Create a clean table with the same structure as the raw table
CREATE OR REPLACE TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_PACKAGETYPES AS
SELECT
  CAST(CASE WHEN PACKAGETYPEID = 'NULL' THEN NULL ELSE PACKAGETYPEID END AS VARCHAR(38)) AS PACKAGETYPEID,
  CAST(CASE WHEN PACKAGETYPENAME = 'NULL' THEN NULL ELSE PACKAGETYPENAME END AS VARCHAR(50)) AS PACKAGETYPENAME
FROM KN_LOGISTICS.SNOWSQL.WAREHOUSE_PACKAGETYPES_RAW;

-- Verify the clean table
SELECT *
FROM KN_LOGISTICS.SNOWSQL.WAREHOUSE_PACKAGETYPES;

--------------------------------------
--Conversion of datatypes
--------------------------------------
ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_PACKAGETYPES
ADD COLUMN PACKAGETYPEID_NUM NUMBER(38,0);

UPDATE KN_LOGISTICS.SNOWSQL.WAREHOUSE_PACKAGETYPES
SET PACKAGETYPEID_NUM = CAST(PACKAGETYPEID AS NUMBER(38,0));

SELECT PACKAGETYPEID_NUM, PACKAGETYPEID
FROM KN_LOGISTICS.SNOWSQL.WAREHOUSE_PACKAGETYPES;

ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_PACKAGETYPES
DROP COLUMN PACKAGETYPEID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_PACKAGETYPES
RENAME COLUMN PACKAGETYPEID_NUM TO PACKAGETYPEID;

SELECT 
    PACKAGETYPEID, PACKAGETYPENAME
FROM KN_LOGISTICS.SNOWSQL.WAREHOUSE_PACKAGETYPES
LIMIT 10;

---------------------------------------
--Addition of primary key to table
---------------------------------------

ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_PACKAGETYPES
ADD CONSTRAINT PK_WAREHOUSE_PACKAGETYPES_PACKAGETYPEID
PRIMARY KEY (PACKAGETYPEID);


---------------------------------------------
--Adding of unique key to table
---------------------------------------------
ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_PACKAGETYPES
ADD CONSTRAINT UK_WAREHOUSE_PACKAGETYPES_PACKAGETYPENAME
UNIQUE (PACKAGETYPENAME);


-----------------------------------------------------
-- ERROR HANDLING
-----------------------------------------------------
WITH CTE AS (
    SELECT 
        PACKAGETYPEID,
        PACKAGETYPENAME,
        LAG(PACKAGETYPEID) OVER (ORDER BY PACKAGETYPEID) AS prev_packagetypeid,
        ROW_NUMBER() OVER (ORDER BY PACKAGETYPEID) AS row_num
    FROM KN_LOGISTICS.SNOWSQL.WAREHOUSE_PACKAGETYPES
)
SELECT 
    PACKAGETYPENAME,
    CASE
        WHEN PACKAGETYPEID IS NULL THEN prev_packagetypeid + 1
        ELSE PACKAGETYPEID
    END AS PACKAGETYPEID
FROM CTE
ORDER BY row_num;

-------------------------------------------------------
--Adding of foreign key to table
-------------------------------------------------------
-- THERE ARE NO FOREIGN KEYS 



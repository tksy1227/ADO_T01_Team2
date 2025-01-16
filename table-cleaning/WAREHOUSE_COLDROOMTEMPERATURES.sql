create or replace TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES (
	COLDROOMTEMPERATUREID VARCHAR NOT NULL,
	COLDROOMSENSORNUMBER VARCHAR,
	RECORDEDWHEN VARCHAR,
	TEMPERATURE VARCHAR,
	constraint PK_COLDROOMTEMPERATURES primary key (COLDROOMTEMPERATUREID)
);

-- count of null values check for WAREHOUSE_COLDROOMTEMPERATURES
SELECT
    SUM(CASE WHEN COLDROOMTEMPERATUREID = NULL THEN 1 ELSE 0 END) AS NULL_COUNT_COLDROOMTEMPERATUREID,
    SUM(CASE WHEN COLDROOMSENSORNUMBER = NULL THEN 1 ELSE 0 END) AS NULL_COUNT_COLDROOMSENSORNUMBER,
    SUM(CASE WHEN RECORDEDWHEN = NULL THEN 1 ELSE 0 END) AS NULL_COUNT_RECORDEDWHEN,
    SUM(CASE WHEN TEMPERATURE = NULL THEN 1 ELSE 0 END) AS NULL_COUNT_TEMPERATURE
FROM 
    KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES;

-- Null value checks for actual null values
SELECT 
    COUNT(CASE WHEN COLDROOMTEMPERATUREID IS NULL THEN 1 END) AS count_COLDROOMTEMPERATUREID_NULL,
    COUNT(CASE WHEN COLDROOMSENSORNUMBER IS NULL THEN 1 END) AS count_COLDROOMSENSORNUMBER_NULL,    
    COUNT(CASE WHEN RECORDEDWHEN IS NULL THEN 1 END) AS count_RECORDEDWHEN_NULL,
    COUNT(CASE WHEN TEMPERATURE IS NULL THEN 1 END) AS count_TEMPERATURE_NULL
FROM KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES;

-- convert null string values into actual null values
UPDATE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
SET COLDROOMTEMPERATUREID = NULL -- oTHERS
WHERE COLDROOMTEMPERATUREID = 'NULL';

UPDATE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
SET COLDROOMSENSORNUMBER = NULL -- oTHERS
WHERE COLDROOMSENSORNUMBER = 'NULL';

UPDATE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
SET RECORDEDWHEN = NULL -- oTHERS
WHERE RECORDEDWHEN = 'NULL';

UPDATE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
SET TEMPERATURE = NULL -- oTHERS
WHERE TEMPERATURE = 'NULL';





-- count of duplicate values in WAREHOUSE_COLDROOMTEMPERATURES
SELECT 
    COLDROOMTEMPERATUREID, 
    COLDROOMSENSORNUMBER, 
    RECORDEDWHEN, 
    TEMPERATURE,
    COUNT(*) AS DUPLICATE_COUNT
FROM KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
GROUP BY 
    COLDROOMTEMPERATUREID, 
    COLDROOMSENSORNUMBER, 
    RECORDEDWHEN, 
    TEMPERATURE
HAVING COUNT(*) > 1;

--  check for NULL values in the primary key
SELECT *
FROM KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
WHERE COLDROOMTEMPERATUREID IS NULL;


-- data type conversion

-- Add new columns with the correct data types
ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
ADD COLUMN COLDROOMTEMPERATUREID_NUM NUMBER(38,0);

ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
ADD COLUMN COLDROOMSENSORNUMBER_NUM NUMBER(38,0);

ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
ADD COLUMN RECORDEDWHEN_TS TIMESTAMP_NTZ(9);

ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
ADD COLUMN TEMPERATURE_FLOAT FLOAT;


-- populate the new columns with the converted values
UPDATE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
SET COLDROOMTEMPERATUREID_NUM = CAST(COLDROOMTEMPERATUREID AS NUMBER),
    COLDROOMSENSORNUMBER_NUM = CAST(COLDROOMSENSORNUMBER AS NUMBER),
    RECORDEDWHEN_TS = CAST(RECORDEDWHEN AS TIMESTAMP_NTZ),
    TEMPERATURE_FLOAT = CAST(TEMPERATURE AS FLOAT);


-- Drop the old columns with VARCHAR data types
ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
DROP COLUMN COLDROOMTEMPERATUREID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
DROP COLUMN COLDROOMSENSORNUMBER;

ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
DROP COLUMN RECORDEDWHEN;

ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
DROP COLUMN TEMPERATURE;


-- Rename the new columns to the original column names
ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
RENAME COLUMN COLDROOMTEMPERATUREID_NUM TO COLDROOMTEMPERATUREID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
RENAME COLUMN COLDROOMSENSORNUMBER_NUM TO COLDROOMSENSORNUMBER;

ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
RENAME COLUMN RECORDEDWHEN_TS TO RECORDEDWHEN;

ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
RENAME COLUMN TEMPERATURE_FLOAT TO TEMPERATURE;


ALTER TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES
ADD CONSTRAINT PK_WAREHOUSE_COLDROOMTEMPERATURES_COLDROOMTEMPERATUREID
PRIMARY KEY (COLDROOMTEMPERATUREID);


-- view all data
SELECT * FROM KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES

-- view data types in each column
SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_SCHEMA = 'SNOWSQL' 
    AND TABLE_NAME = 'WAREHOUSE_COLDROOMTEMPERATURES' 
    AND TABLE_CATALOG = 'KN_LOGISTICS';





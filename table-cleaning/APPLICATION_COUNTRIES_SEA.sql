create or replace TABLE KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA (
	COUNTRYID NUMBER(38,0) NOT NULL,
	COUNTRYNAME VARCHAR(60),
	FORMALNAME VARCHAR(60),
	LATESTRECORDEDPOPULATION NUMBER(38,0),
	CONTINENT VARCHAR(30),
	REGION VARCHAR(30),
	SUBREGION VARCHAR(30),
	constraint UK_APPLICATION_COUNTRIES_SEA_COUNTRYNAME_FORMALNAME unique (COUNTRYNAME, FORMALNAME),
	constraint PK_APPLICATION_COUNTRIES_SEA primary key (COUNTRYID)
);


ALTER TABLE KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA
ADD CONSTRAINT PK_APPLICATION_COUNTRIES_SEA_COUNTRYID
PRIMARY KEY (COUNTRYID);


-----------------------------------------------------------------------------------------
// Null string value "NULL" checks for all columns (only varchar data type columns) 
-----------------------------------------------------------------------------------------
SELECT
    SUM(CASE WHEN COUNTRYNAME = 'NULL' THEN 1 ELSE 0 END) AS NULL_COUNT_COUNTRYNAME,
    SUM(CASE WHEN FORMALNAME = 'NULL' THEN 1 ELSE 0 END) AS NULL_COUNT_FORMALNAME,
    SUM(CASE WHEN CONTINENT = 'NULL' THEN 1 ELSE 0 END) AS NULL_COUNT_CONTINENT,
    SUM(CASE WHEN REGION = 'NULL' THEN 1 ELSE 0 END) AS NULL_COUNT_REGION,
    SUM(CASE WHEN SUBREGION = 'NULL' THEN 1 ELSE 0 END) AS NULL_COUNT_SUBREGION
FROM KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA;

-----------------------------------------------------------------------------------------
// Null value checks for actual null values
-----------------------------------------------------------------------------------------
SELECT 
    COUNT(CASE WHEN COUNTRYNAME IS NULL THEN 1 END) AS count_COUNTRYNAME_NULL,
    COUNT(CASE WHEN FORMALNAME IS NULL THEN 1 END) AS count_FORMALNAME_NULL,
    COUNT(CASE WHEN CONTINENT IS NULL THEN 1 END) AS count_CONTINENT_NULL,
    COUNT(CASE WHEN REGION IS NULL THEN 1 END) AS count_REGION_NULL,
    COUNT(CASE WHEN SUBREGION IS NULL THEN 1 END) AS count_SUBREGION_NULL
FROM KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA;

-----------------------------------------------------------------------------------------
// convert "NULL" string values into actual null values (DONT RUN YET)
-----------------------------------------------------------------------------------------
UPDATE KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA
SET COUNTRYID = NULL
WHERE COUNTRYID = 'NULL';

UPDATE KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA
SET COUNTRYNAME = NULL
WHERE COUNTRYNAME = 'NULL';

UPDATE KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA
SET FORMALNAME = NULL
WHERE FORMALNAME = 'NULL';

UPDATE KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA
SET LATESTRECORDEDPOPULATION = NULL
WHERE LATESTRECORDEDPOPULATION = 'NULL';

UPDATE KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA
SET CONTINENT = NULL
WHERE CONTINENT = 'NULL';

UPDATE KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA
SET REGION = NULL
WHERE REGION = 'NULL';

UPDATE KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA
SET SUBREGION = NULL
WHERE SUBREGION = 'NULL';

-----------------------------------------------------------------------------------------
//check for duplicates
-----------------------------------------------------------------------------------------
SELECT COUNTRYID, COUNTRYNAME, FORMALNAME, COUNT(*) AS count
FROM KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA
GROUP BY COUNTRYID, COUNTRYNAME, FORMALNAME
HAVING COUNT(*) > 1;

-----------------------------------------------------------------------------------------
// validate foreign keys with JOINS
-----------------------------------------------------------------------------------------
// no need


---------------------------------------------
// data type conversion (to number): CITYID, STATEPROVINCEID, LATITUDE, LONGITUDE, LATESTRECORDEDPOPULATION
---------------------------------------------
//COUNTRYID
ALTER TABLE KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA
ADD COLUMN COUNTRYID_NUM NUMBER(38,0);

UPDATE KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA
SET COUNTRYID_NUM = TO_NUMBER(COUNTRYID);

SELECT COUNTRYID, COUNTRYID_NUM
FROM KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA;

ALTER TABLE KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA
DROP COLUMN COUNTRYID;

ALTER TABLE KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA
RENAME COLUMN COUNTRYID_NUM TO COUNTRYID;
// Check 10 rows of SUPPLIERID after updating the data type
SELECT COUNTRYID FROM KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA LIMIT 10;

// Check 10 rows of the whole table after updating the data type
SELECT * FROM KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA;

// LATESTRECORDEDPOPULATION
ALTER TABLE KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA
ADD COLUMN LATESTRECORDEDPOPULATION_NUM NUMBER(38,0);

UPDATE KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA
SET LATESTRECORDEDPOPULATION_NUM = TO_NUMBER(LATESTRECORDEDPOPULATION);

SELECT LATESTRECORDEDPOPULATION, LATESTRECORDEDPOPULATION_NUM
FROM KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA;

ALTER TABLE KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA
DROP COLUMN LATESTRECORDEDPOPULATION;

ALTER TABLE KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA
RENAME COLUMN LATESTRECORDEDPOPULATION_NUM TO LATESTRECORDEDPOPULATION;
// Check 10 rows of SUPPLIERID after updating the data type
SELECT LATESTRECORDEDPOPULATION FROM KN_LOGISTICS.SNOWSQL.APPLICATION_COUNTRIES_SEA LIMIT 10;

--------------------------------------------------
// data type conversion (to timestamp)
--------------------------------------------------
// no need

--------------------------------------------------
// data type conversion (to date)
--------------------------------------------------
// no need


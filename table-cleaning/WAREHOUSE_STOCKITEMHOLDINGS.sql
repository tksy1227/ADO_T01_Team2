create or replace TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_STOCKITEMHOLDINGS (
	STOCKITEMID NUMBER(38,0) NOT NULL,
	QUANTITYONHAND NUMBER(38,0),
	BINLOCATION VARCHAR(16777216),
	LASTSTOCKTAKEQUANTITY NUMBER(38,0),
	LASTCOSTPRICE FLOAT,
	REORDERLEVEL NUMBER(38,0),
	TARGETSTOCKLEVEL NUMBER(38,0),
	constraint PK_STOCKITEMHOLDINGS primary key (STOCKITEMID),
    constraint 
    FK_WAREHOUSE_STOCKITEMHOLDINGS_STOCKITEMID_WAREHOUSE_STOCKITEMS foreign key (STOCKITEMID) references KN_LOGISTICS.SNOWSQL.WAREHOUSE_STOCKITEMS(STOCKITEMID)
);

// Total Number of Null values in string 'NULL' for all var char columns
SELECT COUNT(*) FROM KN_LOGISTICS.SNOWSQL.WAREHOUSE_STOCKITEMHOLDINGS
WHERE BINLOCATION = 'NULL';

// Total Number of Null values for all columns
SELECT COUNT(*) FROM KN_LOGISTICS.SNOWSQL.WAREHOUSE_STOCKITEMHOLDINGS
WHERE STOCKITEMID IS NULL
OR QUANTITYONHAND IS NULL
OR BINLOCATION IS NULL
OR LASTSTOCKTAKEQUANTITY IS NULL
OR LASTCOSTPRICE IS NULL
OR REORDERLEVEL IS NULL
OR TARGETSTOCKLEVEL IS NULL;


// Null value checks for all columns (only varchar data type columns)
SELECT 
    SUM(CASE WHEN BINLOCATION = 'NULL' THEN 1 ELSE 0 END) AS NULL_COUNT_BINLOCATION
FROM 
    KN_LOGISTICS.SNOWSQL.WAREHOUSE_STOCKITEMHOLDINGS;
    

// Null value checks for all columns (only numeric data type columns)
SELECT 
    COUNT(CASE WHEN STOCKITEMID IS NULL THEN 1 END) AS count_STOCKITEMID_NULL,
    COUNT(CASE WHEN QUANTITYONHAND IS NULL THEN 1 END) AS count_STOCKITEMID_NULL,
    COUNT(CASE WHEN LASTSTOCKTAKEQUANTITY IS NULL THEN 1 END) AS count_LASTSTOCKTAKEQUANTITY_NULL,
    COUNT(CASE WHEN LASTCOSTPRICE IS NULL THEN 1 END) AS count_LASTCOSTPRICE_NULL,
    COUNT(CASE WHEN REORDERLEVEL IS NULL THEN 1 END) AS count_REORDERLEVEL_NULL,
    COUNT(CASE WHEN TARGETSTOCKLEVEL IS NULL THEN 1 END) AS count_TARGETSTOCKLEVEL_NULL
FROM KN_LOGISTICS.SNOWSQL.WAREHOUSE_STOCKITEMHOLDINGS;

// Duplicated rows
SELECT STOCKITEMID, COUNT(*) AS count
FROM KN_LOGISTICS.SNOWSQL.WAREHOUSE_STOCKITEMHOLDINGS
GROUP BY STOCKITEMID
HAVING COUNT(*) > 1;

// display all the rows for checking
SELECT *
FROM KN_LOGISTICS.SNOWSQL.WAREHOUSE_STOCKITEMHOLDINGS;

SELECT 
    sih.StockItemID,
    si.StockItemName,
    sih.QuantityOnHand,
    sih.BinLocation,
    sih.LastStocktakeQuantity,
    sih.LastCostPrice,
    sih.ReorderLevel,
    sih.TargetStockLevel
    
FROM 
    KN_LOGISTICS.SNOWSQL.WAREHOUSE_STOCKITEMHOLDINGS AS sih
INNER JOIN 
    KN_LOGISTICS.SNOWSQL.Warehouse_StockItems AS si 
    ON sih.StockItemID = si.StockItemID;
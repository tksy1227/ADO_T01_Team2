create or replace TABLE KN_LOGISTICS.SNOWSQL.PURCHASING_PURCHASEORDERLINES_RAW (
	PURCHASEORDERLINEID VARCHAR(38),
	PURCHASEORDERID VARCHAR(38),
	STOCKITEMID VARCHAR(38),
	ORDEREDOUTERS VARCHAR(38),
	DESCRIPTION VARCHAR(100),
	RECEIVEDOUTERS VARCHAR(38),
	PACKAGETYPEID VARCHAR(38),
	EXPECTEDUNITPRICEPEROUTER VARCHAR(38),
	LASTRECEIPTDATE VARCHAR(20),
	ISORDERLINEFINALIZED VARCHAR(38)
);

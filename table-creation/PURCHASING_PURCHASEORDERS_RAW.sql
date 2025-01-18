create or replace TABLE KN_LOGISTICS.SNOWSQL.PURCHASING_PURCHASEORDERS_RAW (
	PURCHASEORDERID VARCHAR(38),
	SUPPLIERID VARCHAR(38),
	ORDERDATE VARCHAR(20),
	DELIVERYMETHODID VARCHAR(38),
	CONTACTPERSONID VARCHAR(38),
	EXPECTEDDELIVERYDATE VARCHAR(20),
	SUPPLIERREFERENCE VARCHAR(20),
	ISORDERFINALIZED VARCHAR(38)
);
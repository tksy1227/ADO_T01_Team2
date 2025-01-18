create or replace TABLE KN_LOGISTICS.SNOWSQL.PURCHASING_SUPPLIERS_RAW (
	SUPPLIERID VARCHAR(38),
	SUPPLIERNAME VARCHAR(100),
	SUPPLIERCATEGORYID VARCHAR(38),
	PRIMARYCONTACTPERSONID VARCHAR(38),
	ALTERNATECONTACTPERSONID VARCHAR(38),
	DELIVERYMETHODID VARCHAR(38),
	DELIVERYCITYID VARCHAR(38),
	POSTALCITYID VARCHAR(38),
	SUPPLIERREFERENCE VARCHAR(20),
	PAYMENTDAYS VARCHAR(38),
	PHONENUMBER VARCHAR(20),
	WEBSITEURL VARCHAR(256),
	DELIVERYADDRESSLINE VARCHAR(60),
	DELIVERYLOCATIONLAT VARCHAR(60),
	DELIVERYLOCATIONLONG VARCHAR(60)
);
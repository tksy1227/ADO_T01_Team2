create or replace TABLE KN_LOGISTICS.SNOWSQL.SALES_ORDERS_RAW (
	ORDERID VARCHAR(38),
	CUSTOMERID VARCHAR(38),
	SALESPERSONPERSONID VARCHAR(38),
	PICKEDBYPERSONID VARCHAR(38),
	CONTACTPERSONID VARCHAR(38),
	BACKORDERORDERID VARCHAR(38),
	ORDERDATE VARCHAR(20),
	EXPECTEDDELIVERYDATE VARCHAR(20),
	CUSTOMERPURCHASEORDERNUMBER VARCHAR(20),
	ISUNDERSUPPLYBACKORDERED VARCHAR(38),
	PICKINGCOMPLETEDWHEN VARCHAR(25)
);

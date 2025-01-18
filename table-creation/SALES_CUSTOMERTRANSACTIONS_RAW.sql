create or replace TABLE KN_LOGISTICS.SNOWSQL.SALES_CUSTOMERTRANSACTIONS_RAW (
	CUSTOMERTRANSACTIONID VARCHAR(38),
	CUSTOMERID VARCHAR(38),
	TRANSACTIONTYPEID VARCHAR(38),
	INVOICEID VARCHAR(38),
	PAYMENTMETHODID VARCHAR(38),
	TRANSACTIONDATE VARCHAR(20),
	AMOUNTEXCLUDINGTAX VARCHAR(38),
	TAXAMOUNT VARCHAR(38),
	TRANSACTIONAMOUNT VARCHAR(38),
	OUTSTANDINGBALANCE VARCHAR(38),
	FINALIZATIONDATE VARCHAR(20),
	ISFINALIZED VARCHAR(38)
);

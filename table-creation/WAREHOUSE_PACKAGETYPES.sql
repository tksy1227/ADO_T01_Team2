create or replace TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_PACKAGETYPES (
	PACKAGETYPEID NUMBER(38,0) NOT NULL,
	PACKAGETYPENAME VARCHAR(16777216),
	unique (PACKAGETYPENAME),
	primary key (PACKAGETYPEID)
);

create or replace TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_COLDROOMTEMPERATURES (
	COLDROOMTEMPERATUREID NUMBER(38,0) NOT NULL,
	COLDROOMSENSORNUMBER NUMBER(38,0),
	RECORDEDWHEN TIMESTAMP_NTZ(9),
	TEMPERATURE FLOAT,
	primary key (COLDROOMTEMPERATUREID)
);
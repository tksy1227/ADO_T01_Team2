create or replace TABLE KN_LOGISTICS.SNOWSQL.WAREHOUSE_VEHICLETEMPERATURES_RAW (
	VEHICLETEMPERATUREID VARCHAR(38),
	VEHICLEREGISTRATION VARCHAR(255),
	CHILLERSENSORNUMBER VARCHAR(38),
	RECORDEDWHEN VARCHAR(25),
	TEMPERATURE VARCHAR(38),
	FULLSENSORDATA VARCHAR(1000)
);
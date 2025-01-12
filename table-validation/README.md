ABOUT FOLDER table-validation
-----------------------------------------------------------------
This folder compiles the codes we used to validate each table in our dataset in Snowflake SQL Queries to make sure the data cleaning was conducted successfully.

Steps taken to validate the data:
1. Checking of NULL values primary key 
2. Checking of NULL values for whole table (each column)
3. (OPTIONAL, ONLY FOR PEOPLE WITH NULL VALUES IN COLUMNS) Conversion of string null into actual NULL values
3b. Conversion of datatype from VARCHAR into original datatype in data dictionary 
4. (OPTIONAL, ONLY FOR PEOPLE WHO NEED TO RESET THEIR FOREIGN KEYS DUE TO ISSUES) Setting of foreign keys 
4b. Validating of foreign keys (inner join)
5. Checking of duplicate rows in table

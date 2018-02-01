CREATE USER TEST
IDENTIFIED BY "${test.password}"
DEFAULT TABLESPACE ${default.tablespace}
TEMPORARY TABLESPACE ${temp.tablespace}
QUOTA UNLIMITED ON ${data.tablespace}
QUOTA UNLIMITED ON ${index.tablespace}; 

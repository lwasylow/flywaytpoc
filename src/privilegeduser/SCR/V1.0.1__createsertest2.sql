CREATE USER TEST2
IDENTIFIED BY "${test2.password}"
DEFAULT TABLESPACE ${default.tablespace}
TEMPORARY TABLESPACE ${temp.tablespace}
QUOTA UNLIMITED ON ${data.tablespace}
QUOTA UNLIMITED ON ${index.tablespace}; 

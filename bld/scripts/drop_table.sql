DECLARE
   missing_table EXCEPTION;
   PRAGMA EXCEPTION_INIT(missing_table, -942);
BEGIN
   EXECUTE IMMEDIATE 'drop table &&1';
EXCEPTION
   WHEN missing_table THEN
      NULL;
END;
/


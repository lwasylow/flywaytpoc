DECLARE
   missing_role EXCEPTION;
   PRAGMA EXCEPTION_INIT(missing_role, -1919);
BEGIN
   EXECUTE IMMEDIATE 'drop role &&1';
EXCEPTION
   WHEN missing_role THEN
      NULL;
END;
/

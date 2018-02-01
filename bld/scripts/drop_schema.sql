DECLARE
   missing_user EXCEPTION;
   PRAGMA EXCEPTION_INIT(missing_user, -1918);
BEGIN
   EXECUTE IMMEDIATE 'drop user &&1 cascade';
EXCEPTION
   WHEN missing_user THEN
      NULL;
END;
/

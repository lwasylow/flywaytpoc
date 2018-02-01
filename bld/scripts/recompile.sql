DECLARE
   l_invalids BOOLEAN := FALSE;
   l_all BOOLEAN := FALSE;
   l_schema VARCHAR2(30) := '&&1';
   l_retry PLS_INTEGER := 0;
   l_numberofinvalid PLS_INTEGER;
   
   CURSOR c_invalid(i_owner IN all_objects.owner%TYPE) IS
      SELECT COUNT(*)
      FROM   all_objects t
      WHERE  t.status != 'VALID'
      AND    t.owner = i_owner;
      
BEGIN 
   LOOP
      dbms_utility.compile_schema(SCHEMA => l_schema, compile_all => l_all);
      
      OPEN c_invalid(l_schema);
      FETCH c_invalid INTO l_numberofinvalid;
      CLOSE c_invalid;

      IF l_numberofinvalid > 0 THEN
         -- try again with compile_all = true
         l_all := TRUE;
         l_invalids := TRUE;
         l_retry := l_retry + 1;
      END IF;      
      EXIT WHEN (NOT l_invalids) OR (l_invalids AND l_retry>1);
   END LOOP;
END;
/
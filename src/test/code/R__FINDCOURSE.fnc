CREATE OR REPLACE FUNCTION test.findcourse
   ( name_in IN varchar2 )
   RETURN number
IS
   cnumber number;

   cursor c1 is
   SELECT 1 course_number
     FROM DUAL;

BEGIN

   open c1;
   fetch c1 into cnumber;

   if c1%notfound then
      cnumber := 9999;
   end if;

   close c1;

RETURN cnumber;

EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20001,'An error was encountered in function - '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/
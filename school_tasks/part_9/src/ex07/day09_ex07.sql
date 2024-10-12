-- Please write an SQL or pl/pgsql function `func_minimum` (it is up to you)
-- that has an input parameter that is an array of numbers and the function
-- should return a minimum value.

CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC AS
$minminminmin$
    BEGIN
        RETURN (SELECT MIN(massiv_strok) FROM unnest($1) massiv_strok); --unnest 
    END;
$minminminmin$
LANGUAGE PLpgSQL;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
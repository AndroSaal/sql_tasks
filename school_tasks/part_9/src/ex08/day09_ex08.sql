-- Write an SQL or pl/pgsql function `fnc_fibonacci` (it's up to you)
-- that has an input parameter pstop of type integer (default is 10)
-- and the function output is a table of all Fibonacci numbers less than pstop.

CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop INTEGER DEFAULT 10)
RETURNS TABLE(num integer) AS
$FIBONACCCCCCCI$
BEGIN
    RETURN QUERY 
    (WITH RECURSIVE cte_fib(num1, num2) AS (
        VALUES (0, 1)
        UNION ALL
            SELECT
            GREATEST(num1, num2), num1 + num2
        FROM cte_fib
            WHERE num2 < pstop
    )
    SELECT num1 FROM cte_fib);
    -- RETURN QUERY;
END;
$FIBONACCCCCCCI$
LANGUAGE PLpgSQL;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
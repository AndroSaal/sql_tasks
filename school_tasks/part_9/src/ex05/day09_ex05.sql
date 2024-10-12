

CREATE OR REPLACE FUNCTION fnc_persons (IN pgender VARCHAR DEFAULT 'female')
RETURNS TABLE (
    id BIGINT,
    name VARCHAR,
    age INTEGER, 
    gender VARCHAR,
    address VARCHAR
) AS
$all_rows$
        SELECT id, name, age, gender, address FROM person WHERE gender = pgender;
$all_rows$
LANGUAGE SQL;

SELECT * FROM fnc_persons(pgender := 'male'); --явное указание внутренней переменной

SELECT * FROM fnc_persons(); -- берёт е подефолту
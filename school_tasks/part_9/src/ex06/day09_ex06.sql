-- Please create a pl/pgsql function `fnc_person_visits_and_eats_on_date`
-- based on an SQL statement that will find the names of pizzerias that a
-- person (`IN` pperson parameter with default value 'Dmitriy') visited and
-- where he could buy pizza for less than the given amount in rubles (`IN`
-- pprice parameter with default value 500) on the given date (`IN` pdate
-- parameter with default value January 8, 2022).

CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date
    (IN pperson VARCHAR DEFAULT 'Dmitriy',
     IN pprice int DEFAULT 500,
     IN pdate date DEFAULT '2022-01-08')
    RETURNS TABLE(
        pizzeria_name VARCHAR
    ) AS 
$pizzeria_names_with_constraints$
BEGIN
    RETURN QUERY
        SELECT piz.name FROM pizzeria piz
        INNER JOIN person_visits pv ON piz.id = pv.pizzeria_id
        INNER JOIN person p ON p.id = pv.person_id
        INNER JOIN menu ON pv.pizzeria_id = menu.pizzeria_id
        WHERE p.name = pperson
        AND menu.price < pprice
        AND pv.visit_date = pdate;
END; 
$pizzeria_names_with_constraints$
LANGUAGE PLpgSQL;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
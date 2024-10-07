-- Please create a Materialized View mv_dmitriy_visits_and_eats 
-- (with data included) based on the SQL statement that finds the
-- name of the pizzeria where Dmitriy visited on January 8, 2022
-- and could eat pizzas for less than 800 rubles (this SQL can be
-- found at Day #02 Exercise #07).

-- DAY_02_EX07 
SELECT piz.name AS pizzeria_name
FROM person p
INNER JOIN (
    SELECT * FROM person_visits
    WHERE visit_date = '2022-01-08'
) pv ON pv.person_id = p.id
INNER JOIN (
    SELECT * FROM menu
    WHERE price <= 800
) m ON m.pizzeria_id = pv.pizzeria_id
INNER JOIN pizzeria piz ON pv.pizzeria_id = piz.id
WHERE p.name = 'Dmitriy';

CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
    SELECT piz.name AS pizzeria_name
    FROM person p
    INNER JOIN (
        SELECT * FROM person_visits
        WHERE visit_date = '2022-01-08'
    ) pv ON pv.person_id = p.id
    INNER JOIN (
        SELECT * FROM menu
        WHERE price <= 800
    ) m ON m.pizzeria_id = pv.pizzeria_id
    INNER JOIN pizzeria piz ON pv.pizzeria_id = piz.id
    WHERE p.name = 'Dmitriy';

SELECT * FROM mv_dmitriy_visits_and_eats;
-- DROP MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
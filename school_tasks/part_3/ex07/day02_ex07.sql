-- name of the pizzeria Dmitriy visited on January 8, 2022
-- and could eat pizza for less than 800 rubles

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
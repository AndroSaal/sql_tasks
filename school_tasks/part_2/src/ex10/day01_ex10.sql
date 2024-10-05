-- SELECT DISTINCT 
--     person.name AS person_name, 
--     menu.pizza_name AS pizza_name, 
--     pizzeria.name AS pizzeria_name
-- FROM person
-- JOIN person_order ON person.id = person_order.person_id
-- JOIN menu ON person_order.menu_id = menu.id
-- JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
-- ORDER BY person_name, pizza_name, pizzeria_name;

SELECT DISTINCT
    (SELECT name FROM person WHERE id = person_order.person_id) AS person_name,
    (SELECT pizza_name FROM menu WHERE id = person_order.menu_id) AS pizza_name,
    (SELECT name FROM pizzeria WHERE id = menu.pizzeria_id) AS pizzeria_name
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN person ON person.id = person_order.person_id
ORDER BY person_name, pizza_name, pizzeria_name

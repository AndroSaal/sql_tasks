-- Find the names of all women who ordered both pepperoni and cheese pizzas
-- (at any time and in any pizzerias). Make sure that the result is ordered by person's name

SELECT DISTINCT p.name
FROM person p
INNER JOIN (SELECT DISTINCT * FROM person_order po
            INNER JOIN menu ON po.menu_id = menu.id) po ON po.person_id = p.id
WHERE po.pizza_name IN ('cheese pizza', 'pepperoni pizza')
    AND p.gender = 'female'
ORDER BY p.name;

-- SELECT p.name 
-- FROM person p
-- INNER JOIN (SELECT DISTINCT * FROM person_order po
--             INNER JOIN menu ON po.menu_id = menu.id
--             WHERE menu.pizza_name = 'mushroom pizza' 
--             OR menu.pizza_name = 'pepperoni pizza') po ON po.person_id = p.id
-- WHERE p.gender = 'female'
-- GROUP BY p.name
-- HAVING COUNT(p.name) > 1
-- ORDER BY p.name;
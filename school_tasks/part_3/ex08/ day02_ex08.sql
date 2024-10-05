SELECT p.name AS name
FROM person p
INNER JOIN (
    SELECT * FROM person_order po
    INNER JOIN menu ON po.menu_id = menu.id
    WHERE pizza_name = 'mushroom pizza'
        OR pizza_name = 'pepperoni pizza'
) po ON po.person_id = p.id
WHERE (p.address = 'Moscow' 
    OR p.address = 'Samara')
    AND gender = 'male'
ORDER BY name DESC;
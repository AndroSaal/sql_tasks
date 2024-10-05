-- проверить на гитхаб

SELECT pizza_name, pizzeria.name AS pizzeria_name
FROM (SELECT * FROM menu
      INNER JOIN person_order po ON po.menu_id = menu.id
      INNER JOIN person p ON po.person_id = p.id
      WHERE p.name = 'Denis' OR p.name = 'Anna') AS AD_menu
INNER JOIN pizzeria ON pizzeria.id = AD_menu.pizzeria_id
ORDER BY pizza_name, pizzeria_name;
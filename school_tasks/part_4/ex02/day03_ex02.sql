-- Please use the SQL statement from Exercise #01 and display 
-- the names of pizzas from the pizzeria that no one has ordered, 
-- including the corresponding prices. The result should be sorted by pizza name and price. 

-- SELECT m.pizza_name AS pizza_name,
--        m.price AS price,
--        piz.name AS pizzeria_name
-- FROM menu m
-- INNER JOIN pizzeria piz ON m.pizzeria_id = piz.id
-- LEFT OUTER JOIN person_order po ON m.id = po.menu_id
-- WHERE po.id IS NULL
-- ORDER BY pizza_name, price;

SELECT men.pizza_name, men.price, pizzeria.name AS pizzeria_name
FROM (SELECT id FROM menu
      EXCEPT
      (SELECT menu_id FROM person_order)) m
INNER JOIN menu men ON m.id = men.id
INNER JOIN pizzeria ON men.pizzeria_id = pizzeria.id
ORDER BY pizza_name, price;
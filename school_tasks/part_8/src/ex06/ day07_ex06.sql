-- Please write a SQL statement that returns the number
-- of orders, the average price, the maximum price and
-- the minimum price for pizzas sold by each pizzeria restaurant.
-- The result should be sorted by pizzeria name. See the sample
-- data below.
-- Round the average price to 2 floating numbers.

SELECT piz.name, 
       COUNT(pizzeria_id) AS total_count,
       ROUND(AVG(price), 2) AS average_price,
       MAX (price) AS max_price,
       MIN (price) AS min_price
FROM person_order po
INNER JOIN menu m ON m.id = po.menu_id
INNER JOIN pizzeria piz ON m.pizzeria_id = piz.id
GROUP BY piz.name
ORDER BY name;
-- Please write a SQL statement that returns a list of pizza names, 
-- pizza prices, pizzeria names, and visit dates for Kate and for 
-- prices ranging from 800 to 1000 rubles. Please sort by pizza, price, 
-- and pizzeria name. See a sample of the data below.

SELECT m.pizza_name AS pizza_name, 
       m.price AS price, 
       piz.name AS pizzeria_name, 
       pv.visit_date AS visit_date
FROM person_visits pv
INNER JOIN person p ON p.id = pv.person_id
INNER JOIN pizzeria piz ON piz.id = pv.pizzeria_id
INNER JOIN menu m ON m.pizzeria_id = pv.pizzeria_id
WHERE p.name = 'Kate' AND m.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name;

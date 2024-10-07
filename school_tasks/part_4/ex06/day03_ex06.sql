-- Find the same pizza names that have the same price, 
-- but from different pizzerias. Make sure that the result 
-- is ordered by pizza name.

SELECT
    m1.pizza_name,
    piz1.name AS pizzeria_name_1,
    piz2.name AS pizzeria_name_2,
    m1.price
FROM menu m1
INNER JOIN menu m2 ON m1.price = m2.price
INNER JOIN pizzeria piz1 ON piz1.id = m1.pizzeria_id
INNER JOIN pizzeria piz2 ON piz2.id = m2.pizzeria_id
WHERE m1.id > m2.id 
    AND m1.pizza_name = m2.pizza_name
ORDER BY pizza_name;

-- Write an SQL statement that returns a list of pizzerias 
-- that Andrey visited but did not order from. Please order 
-- by the name of the pizzeria.

SELECT piz.name
FROM (SELECT id
      FROM person p
      WHERE p.name = 'Andrey') AS p
FULL OUTER JOIN person_visits pv ON p.id = pv.person_id -- все поля визитов
INNER JOIN pizzeria piz ON pv.pizzeria_id = piz.id -- все посещенные поля пиццерий
LEFT OUTER JOIN person_order po ON pv.visit_date = po.order_date -- магия
WHERE po.order_date IS NULL;
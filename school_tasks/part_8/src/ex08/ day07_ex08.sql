-- We know personal addresses from our data. Let's
-- assume that this person only visits pizzerias
-- in his city. Write a SQL statement that returns
-- the address, the name of the pizzeria, and the
-- amount of the person's orders. The result should
-- be sorted by address and then by restaurant name.

SELECT p.address,
       piz.name,
       COUNT (pizzeria_id) AS count_of_orders
FROM person_order po
INNER JOIN person p ON p.id = po.person_id
INNER JOIN menu m ON po.menu_id = m.id
INNER JOIN pizzeria piz ON piz.id = m.pizzeria_id
GROUP BY p.address, piz.name
ORDER BY p.address, piz.name;

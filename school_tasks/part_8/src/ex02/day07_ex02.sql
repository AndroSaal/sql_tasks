-- Please write a SQL statement to see 3 favorite restaurants
-- by visits and by orders in a list (please add an action_type
-- column with values 'order' or 'visit', it depends on the
-- data from the corresponding table). Please have a look at
-- the example data below. The result should be sorted in
-- ascending order by the action_type column and in descending
-- order by the count column.

(SELECT piz.name, COUNT(po.order_date) AS count,
       'order' AS action_type
FROM person_order po
INNER JOIN menu m ON po.menu_id = m.id
INNER JOIN pizzeria piz ON piz.id = m.pizzeria_id
GROUP BY piz.name
ORDER BY count DESC
LIMIT 3)
UNION
(SELECT piz.name, COUNT(pv.visit_date) AS count,
        'visit' AS action_type
FROM person_visits pv
INNER JOIN pizzeria piz ON piz.id = pv.pizzeria_id
GROUP BY piz.name
ORDER BY count DESC
LIMIT 3)
ORDER BY action_type ASC, count DESC;

-- DROP TABLE pizzeria, menu, person_order, person_visits, person, person_discounts CASCADE;

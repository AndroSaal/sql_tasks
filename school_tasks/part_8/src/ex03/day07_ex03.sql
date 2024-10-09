-- Write an SQL statement to see how restaurants are grouped
-- by visits and by orders, and joined together by restaurant name.
-- You can use the internal SQL from Exercise 02 (Restaurants
-- by Visits and by Orders) without any restrictions on the number of rows.
-- In addition, add the following rules.

-- Compute a sum of orders and visits for the corresponding pizzeria
-- (note that not all pizzeria keys are represented in both tables).
-- Sort the results by the total_count column in descending order
-- and by the name column in ascending order.
-- Take a look at the example data below.

CREATE VIEW restaurants_orders AS
(SELECT piz.name, COUNT(po.order_date) AS count,
       'order' AS action_type
FROM person_order po
INNER JOIN menu m ON po.menu_id = m.id
INNER JOIN pizzeria piz ON piz.id = m.pizzeria_id
GROUP BY piz.name
ORDER BY count DESC);


CREATE VIEW restaurants_visit AS
(SELECT piz.name, COUNT(pv.visit_date) AS count,
        'visit' AS action_type
FROM person_visits pv
INNER JOIN pizzeria piz ON piz.id = pv.pizzeria_id
GROUP BY piz.name
ORDER BY count DESC);

SELECT rv.name, 
       COALESCE(ro.count, 0) + COALESCE(rv.count, 0) AS total_count
FROM restaurants_orders ro
FULL OUTER JOIN restaurants_visit rv ON ro.name = rv.name
ORDER BY total_count DESC, name;

DROP VIEW restaurants_orders;
DROP VIEW restaurants_visit;
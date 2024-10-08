-- Write a SQL statement that returns the orders with actual
-- price and price with discount applied for each person in
-- the corresponding pizzeria restaurant, sorted by person name
-- and pizza name. Please see the sample data below.

SELECT DISTINCT p.name, m.pizza_name, m.price,
       (m.price - m.price*(pd.discount/100)) :: real AS discount_price,
       piz.name
FROM person_order po
    INNER JOIN person p ON p.id = po.person_id
    INNER JOIN menu m ON m.id = po.menu_id
    INNER JOIN pizzeria piz ON piz.id = m.pizzeria_id
    INNER JOIN person_discounts pd ON po.person_id = pd.person_id AND piz.id = pd.pizzeria_id
ORDER BY p.name, m.pizza_name;
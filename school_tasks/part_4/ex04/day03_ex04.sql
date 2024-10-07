-- Find a union of pizzerias that have orders from either women or men.
-- In other words, you should find a set of names of pizzerias that have
-- been ordered only by women and make "UNION" operation with set of names
-- of pizzerias that have been ordered only by men. Please be careful with
-- word "only" for both genders. For all SQL operators with sets dont
-- store duplicates (UNION, EXCEPT, INTERSECT). Please sort a result by
-- the name of the pizzeria.

(SELECT piz.name AS pizzeria_name -- посетили только женщины 
FROM (SELECT * 
      FROM person p
      WHERE gender = 'female') AS p
INNER JOIN person_order po ON po.person_id = p.id
INNER JOIN menu m ON m.id = po.menu_id
INNER JOIN pizzeria piz ON piz.id = m.pizzeria_id
EXCEPT
SELECT piz.name AS pizzeria_name
FROM (SELECT * 
      FROM person p
      WHERE gender = 'male') AS p
INNER JOIN person_order po ON po.person_id = p.id
INNER JOIN menu m ON m.id = po.menu_id
INNER JOIN pizzeria piz ON piz.id = m.pizzeria_id)
UNION ALL
(SELECT piz.name AS pizzeria_name -- посетили только мужчины
FROM (SELECT * 
      FROM person p
      WHERE gender = 'male') AS p
INNER JOIN person_order po ON po.person_id = p.id
INNER JOIN menu m ON m.id = po.menu_id
INNER JOIN pizzeria piz ON piz.id = m.pizzeria_id
EXCEPT
SELECT piz.name AS pizzeria_name
FROM (SELECT * 
      FROM person p
      WHERE gender = 'female') AS p
INNER JOIN person_order po ON po.person_id = p.id
INNER JOIN menu m ON m.id = po.menu_id
INNER JOIN pizzeria piz ON piz.id = m.pizzeria_id)
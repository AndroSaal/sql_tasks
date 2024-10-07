-- Please find pizzerias that have been visited more often by women or by men.
-- Save duplicates for any SQL operators with sets (UNION ALL, EXCEPT ALL, 
-- INTERSECT ALL constructions). Please sort a result by the name of the pizzeria.

--Нахождение пиццерий с женщинами
((SELECT piz.name AS pizzeria_name
FROM pizzeria piz
INNER JOIN person_visits pv ON pv.pizzeria_id = piz.id
INNER JOIN person p ON p.id = pv.person_id
WHERE p.gender = 'female')
EXCEPT ALL
(SELECT piz.name AS pizzeria_name
FROM pizzeria piz
INNER JOIN person_visits pv ON pv.pizzeria_id = piz.id
INNER JOIN person p ON p.id = pv.person_id
WHERE p.gender = 'male'))
UNION ALL
--Нахождение пиццерий с мужчинами
((SELECT piz.name AS pizzeria_name
FROM pizzeria piz
INNER JOIN person_visits pv ON pv.pizzeria_id = piz.id
INNER JOIN person p ON p.id = pv.person_id
WHERE p.gender = 'male')
EXCEPT ALL
(SELECT piz.name AS pizzeria_name
FROM pizzeria piz
INNER JOIN person_visits pv ON pv.pizzeria_id = piz.id
INNER JOIN person p ON p.id = pv.person_id
WHERE p.gender = 'female')) 
ORDER BY pizzeria_name;
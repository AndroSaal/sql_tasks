-- Please modify an SQL statement from Exercise 00
-- and return a person name (not an identifier).
-- Additional clause is we need to see only top 4
-- people with maximum visits in each pizzerias and
-- sorted by a person name.

SELECT p.name, COUNT(visit_date) AS count_of_visits
FROM person_visits pv
INNER JOIN person p ON p.id = pv.person_id
GROUP BY p.name
ORDER BY count_of_visits DESC, p.name ASC
LIMIT 4;
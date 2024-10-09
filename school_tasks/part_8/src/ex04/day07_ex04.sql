-- Please write a SQL statement that returns the person's name 
-- and the corresponding number of visits to any pizzerias if
-- the person has visited more than 3 times (> 3). 
-- Please take a look at the sample data below.

SELECT p.name, pv.lol AS count_of_visits
FROM (
    SELECT person_id, COUNT(person_id) AS lol
    FROM person_visits
    GROUP BY person_id
    HAVING COUNT(person_id) > 3
) AS pv
INNER JOIN person p ON p.id = pv.person_id
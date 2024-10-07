-- Let's refresh the data in our Materialized View 
-- mv_dmitriy_visits_and_eats from Exercise #06.
-- Before this action, please create another Dmitriy
-- visit that satisfies the SQL clause of the Materialized
-- View except pizzeria, which we can see in a result from
-- Exercise #06. After adding a new visit, please update a
-- data state for mv_dmitriy_visits_and_eats

-- name of the pizzeria where Dmitriy visited on January 8, 2022
-- and could eat pizzas for less than 800 rubles

INSERT INTO person_visits 
    VALUES (
    (SELECT MAX(pv.id) FROM person_visits pv) + 1,
    (SELECT person.id FROM person
     WHERE name = 'Dmitriy'),
    (SELECT piz.id FROM pizzeria piz
     INNER JOIN menu m ON piz.id = m.pizzeria_id
     INNER JOIN mv_dmitriy_visits_and_eats 
        mv ON mv.pizzeria_name != piz.name
     WHERE m.price < 800 LIMIT 1),
    '2022-01-08'
    );

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
-- After all our exercises, we have a couple of Virtual Tables
-- and a Materialized View. Let's drop them!

-- ex00
DROP VIEW v_persons_female;
DROP VIEW v_persons_male;

-- ex02
DROP VIEW v_generated_dates;

-- ex04
DROP VIEW v_symmetric_union;
DROP VIEW R;
DROP VIEW S;

-- ex05
DROP VIEW v_price_with_discount;

-- ex06
DROP MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

SELECT * FROM person_visits;

SELECT name FROM pizzeria
WHERE id = 3;

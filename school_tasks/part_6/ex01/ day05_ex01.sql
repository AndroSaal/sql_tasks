-- С джойнами запрос проходит быстрее
-- Без seq_scan работает медленно

SET enable_seqscan TO OFF;

EXPLAIN ANALYZE
    SELECT pizza_name,
           piz.name AS pizzeria_name
    FROM menu
    INNER JOIN pizzeria piz ON menu.pizzeria_id = piz.id;
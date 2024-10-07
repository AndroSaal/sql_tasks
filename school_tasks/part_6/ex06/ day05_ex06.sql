-- Take a look at the SQL below from a technical perspective
-- (ignore a logical case of this SQL statement).

-- SELECT
--     m.pizza_name AS pizza_name,
--     max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
-- FROM  menu m
-- INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
-- ORDER BY 1,2;

-- Create a new BTree index named idx_1 that should improve
-- the "Execution Time" metric of this SQL. Provide evidence
-- (EXPLAIN ANALYZE) that the SQL has been improved.

CREATE UNIQUE INDEX IF NOT EXISTS idx_1 ON pizzeria (rating);
-- DROP INDEX idx_1;
SET enable_seqscan = OFF;

EXPLAIN ANALYZE
    SELECT
        m.pizza_name AS pizza_name,
        max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
    FROM  menu m
    INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
    ORDER BY 1,2;
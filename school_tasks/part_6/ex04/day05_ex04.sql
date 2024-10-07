-- Please create a unique BTree index named idx_menu_unique
-- on the menu table for  pizzeria_id and pizza_name columns.
-- Write and provide any SQL with proof (EXPLAIN ANALYZE) that
-- index idx_menu_unique works.

-- SELECT pizzeria_id, pizza_name, COUNT(*)
-- FROM menu
-- GROUP BY pizzeria_id, pizza_name
-- HAVING COUNT(*) > 1;
-- DELETE FROM person_order 
-- WHERE menu_id = (SELECT menu_id FROM menu 
--                  WHERE pizza_name ='sicilian pizza' LIMIT 1);

-- DELETE FROM menu WHERE pizza_name = 'sicilian pizza';



-- DROP INDEX IF EXISTS idx_person_order_menu_id;

CREATE UNIQUE INDEX IF NOT EXISTS idx_menu_unique
ON menu(pizzeria_id, pizza_name);

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
    SELECT pizza_name FROM menu
    WHERE pizza_name = 'cheese pizza';

SELECT * FROM pg_indexes
WHERE tablename = 'menu';
-- Find all menu identifiers that are not ordered by anyone.
--  The result should be sorted by identifier.

-- SELECT m.id AS menu_id
-- FROM menu m
-- LEFT OUTER JOIN person_order po ON m.id = po.menu_id
-- WHERE po.id IS NULL
-- GROUP BY m.id;

SELECT id 
FROM (SELECT id FROM menu
      EXCEPT
      (SELECT menu_id FROM person_order))
ORDER BY id;
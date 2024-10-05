SELECT pizza_name AS object_name
FROM menu
UNION ALL
SELECT NAME
FROM person AS object_name
ORDER BY object_name;

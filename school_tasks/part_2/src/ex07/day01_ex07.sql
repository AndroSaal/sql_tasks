-- SELECT order_date,
--     (SELECT name || ' age:' || age AS person_information FROM person WHERE person.id = person_order.person_id)
-- FROM person_order
-- ORDER BY order_date, person_information;

SELECT order_date,
    (SELECT person.name || ' age:' || person.age AS person_information)
FROM person_order
INNER JOIN person ON person.id = person_order.person_id
ORDER BY order_date, person_information;
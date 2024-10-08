-- - Take aggregated state from person_id and pizzeria_id columns.

-- - Calculate personal discount value by the next pseudo code:
-- if “amount of orders” = 1 then “discount” = 10.5  else if 
-- “amount of orders” = 2 then  “discount” = 22 else  “discount” = 30

-- - To create a primary key for the person_discounts table, use the
-- following SQL construct (this construct is from the WINDOW FUNCTION SQL section).

-- DROP TABLE person_discounts;

INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
(
    SELECT ROW_NUMBER() OVER() AS 
           id,
           person_id,
           m.pizzeria_id,
           (CASE
               WHEN COUNT(po.person_id) = 1 THEN 10.5
               WHEN COUNT(po.person_id) = 2 THEN 22
               ELSE 30
            END)
    FROM person_order po
    INNER JOIN menu m ON po.menu_id = m.id
        GROUP BY po.person_id, m.pizzeria_id
    ORDER BY person_id
);

SELECT * FROM person_discounts;





-- SELECT ROW_NUMBER() OVER() AS
--            id,
--            person_id,
--            m.pizzeria_id,
--            (CASE
--                WHEN COUNT(po.person_id) = 1 THEN 10.5
--                WHEN COUNT(po.person_id) = 2 THEN 22
--                ELSE 30
--             END)
--     FROM person_order po
--     INNER JOIN menu m ON po.menu_id = m.id
--         GROUP BY po.person_id, m.pizzeria_id
--     ORDER BY person_id;

-- SELECT * FROM menu
-- GROUP BY person.id

-- insert into person_order values (1,1, 1, '2022-01-01');
-- insert into person_order values (2,1, 2, '2022-01-01');

-- insert into person_order values (3,2, 8, '2022-01-01');
-- insert into person_order values (4,2, 9, '2022-01-01');

-- insert into person_order values (5,3, 16, '2022-01-04');

-- insert into person_order values (6,4, 16, '2022-01-07');
-- insert into person_order values (7,4, 17, '2022-01-07');
-- insert into person_order values (8,4, 18, '2022-01-07');
-- insert into person_order values (9,4, 6, '2022-01-08');
-- insert into person_order values (10,4, 7, '2022-01-08');

-- insert into person_order values (11,5, 6, '2022-01-09');
-- insert into person_order values (12,5, 7, '2022-01-09');

-- insert into person_order values (13,6, 13, '2022-01-01');

-- insert into person_order values (14,7, 3, '2022-01-03');
-- insert into person_order values (15,7, 9, '2022-01-05');
-- insert into person_order values (16,7, 4, '2022-01-05');

-- insert into person_order values (17,8, 8, '2022-01-06');
-- insert into person_order values (18,8, 14, '2022-01-07');

-- insert into person_order values (19,9, 18, '2022-01-09');
-- insert into person_order values (20,9, 6, '2022-01-10');

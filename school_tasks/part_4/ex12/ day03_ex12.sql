-- Please register new orders of all persons for "greek pizza" on February 25, 2022.

INSERT INTO person_order (id, person_id, menu_id, order_date)
    VALUES (
        generate_series( -- id
            (SELECT MAX(id) FROM person_order) + 1,
            (SELECT MAX(id) FROM person) + (SELECT MAX(id) FROM person_order),
            1
        ), 
        generate_series( -- person_id
            (SELECT MIN(id) FROM person), 
            (SELECT MAX(id) FROM person),
            1
        ),
        (SELECT id FROM menu -- menu_id
         WHERE pizza_name = 'greek pizza'),
        '2022-02-25' -- order_date
    );

SELECT * FROM person_order
WHERE order_date = '2022-02-25';

SELECT * FROM person;
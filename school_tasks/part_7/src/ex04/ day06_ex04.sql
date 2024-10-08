-- Please add the following constraint rules for existing columns 
-- of the person_discounts table.

-- person_id column should not be NULL (use constraint name ch_nn_person_id);
-- pizzeria_id column should not be NULL (use constraint name ch_nn_pizzeria_id);
-- discount column should not be NULL (use constraint name ch_nn_discount);
-- discount column should be 0 percent by default;
-- discount column should be in a range values from 0 to 100
-- (use constraint name ch_range_discount).

ALTER TABLE person_discounts ADD constraint ch_nn_person_id CHECK (person_id IS NOT NULL);
ALTER TABLE person_discounts ADD constraint ch_nn_pizzeria_id CHECK (pizzeria_id IS NOT NULL);
ALTER TABLE person_discounts ADD constraint ch_nn_discount CHECK (discount IS NOT NULL);
ALTER TABLE person_discounts ADD constraint ch_range_discount CHECK (discount BETWEEN 0 AND 100);
ALTER TABLE person_discounts ALTER COLUMN discount SET DEFAULT 0;

-- Запрос-проверка существующих ограничений
SELECT 
    conname AS constraint_name,
    contype AS constraint_type,
    pg_get_constraintdef(oid) AS constraint_definition
FROM 
    pg_constraint
WHERE 
    conrelid = 'person_discounts'::regclass;

-- c: Ограничение CHECK
-- f: Ограничение FOREIGN KEY
-- p: Ограничение PRIMARY KEY
-- u: Ограничение UNIQUE
-- t: Триггер ограничения (constraint trigger)
-- x: Ограничение EXCLUDE
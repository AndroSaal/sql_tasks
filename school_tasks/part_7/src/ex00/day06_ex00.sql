-- Let's add a new business feature to our data model.
-- Every person wants to see a personal discount and every 
-- business wants to be closer for customers.
-- Think about personal discounts for people from one side and
-- pizza restaurants from the other. Need to create a new relational
-- table (please set a name person_discounts) with the following rules.

-- - Set id attribute like a Primary Key (please have a look at id column
-- in existing tables and choose the same data type).
-- - Set attributes person_id and pizzeria_id as foreign keys for
-- corresponding tables (data types should be the same as for id columns
-- in corresponding parent tables).
-- - Please set explicit names for foreign key constraints using the
-- pattern fk_{table_name}_{column_name}, for example fk_person_discounts_person_id.
-- - Add a discount attribute to store a discount value in percent.
-- - Remember that the discount value can be a floating-point number
-- (just use the numeric datatype). So please choose the appropriate
-- datatype to cover this possibility.

CREATE TABLE IF NOT EXISTS person_discounts (
    -- Задаем поля (атрибуты)
    id SERIAL PRIMARY KEY, -- SERIAL генерация последовательнности чисел при создании записи
    person_id BIGINT, 
    pizzeria_id BIGINT,
    discount numeric(8,2),
    -- Задаем ограничения на поля (атрибуты)
    constraint fk_person_discounts_person_id
        FOREIGN KEY (person_id) REFERENCES person(id),
    constraint fk_person_discounts_pizzeria_id
        FOREIGN KEY (pizzeria_id) REFERENCES pizzeria(id)
)


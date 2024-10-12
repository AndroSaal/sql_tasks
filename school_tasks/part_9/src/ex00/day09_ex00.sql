-- Please create a table person_audit with the same structure as
-- a person table, but please add some additional changes. Take a
-- look at the table below with descriptions for each column.

-- Actually, let’s create a Database Trigger Function with the name
-- fnc_trg_person_insert_audit that should process INSERT DML traffic
-- and make a copy of a new row in the person_audit table.
-- Just a hint, if you want to implement a PostgreSQL trigger
-- (please read it in PostgreSQL documentation), you need to create 2 objects:
-- Database Trigger Function and Database Trigger.
-- So, please define a Database Trigger with the name trg_person_insert_audit with
-- the following options:

-- trigger with "FOR EACH ROW" option;
-- trigger with "AFTER INSERT";
-- trigger calls fnc_trg_person_insert_audit trigger function.

-- When you are done with the trigger objects, please issue an INSERT statement into the person table.
-- INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

-- SELECT conname, pg_get_constraintdef(c.oid, true) as condef
-- FROM pg_constraint c
-- JOIN pg_namespace n ON n.oid = c.connamespace
-- WHERE n.nspname = 'public' AND c.conrelid::regclass::text = 'person';
-- DROP TABLE person_audit;

CREATE TABLE IF NOT EXISTS person_audit ( -- Создание таблицы
    created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    type_ivent CHAR(1) DEFAULT 'I' NOT NULL,
    row_id BIGINT NOT NULL,
    name VARCHAR, 
    age INTEGER,
    gender VARCHAR, 
    address VARCHAR
    CONSTRAINT ch_type_event -- Проверка на тип события
        CHECK (type_ivent IN ('I', 'D', 'U'))
);

-- new - Переменная содержит новую строку базы данных для команд INSERT / UPDATE
-- в триггерах уровня строки, для delete значение не присваивается

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS
$person_audit_trigger_fnk_body$ -- название блока тела функции
BEGIN
    IF (TG_OP = 'INSERT') THEN -- TG_OP переменная хранящая тип операции, вызв. триггер
        INSERT INTO person_audit (created, type_ivent, row_id,
                                  name, age, gender, address)
            VALUES (CURRENT_TIMESTAMP, 'I', new.id, new.name, new.age, new.gender, new.address);
    END IF; -- закрытие блока IF
    RETURN NULL; -- функция триггера должна возвращать значение NULL, 
END;             -- чтобы не прерывать выполнение основной операции.
$person_audit_trigger_fnk_body$
LANGUAGE PLpgSQL;

CREATE TRIGGER trg_person_insert_audit AFTER INSERT -- Создание триггера на инсерт
    ON person -- инсерт в таблице персон
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit(); --вызов триггерной функции для каждой новой строки

INSERT INTO person(id, name, age, gender, address)
VALUES (10,'Damir', 22, 'male', 'Irkutsk');

SELECT * FROM person_audit;


-- SET session_replication_role = 'replica'; DROP TABLE IF EXISTS person_order; DROP TABLE IF EXISTS person_visits; DROP TABLE IF EXISTS menu; DROP TABLE IF EXISTS pizzeria; DROP TABLE IF EXISTS person; SET session_replication_role = 'origin';

-- Actually, there are 3 triggers for one person table. Let's merge all our
-- logic into one main trigger called trg_person_audit and a new corresponding
-- trigger function fnc_trg_person_audit.
-- In other words, all DML traffic (INSERT, UPDATE, DELETE) should be handled
-- by the one function block. Please explicitly define a separate IF-ELSE block
-- for each event (I, U, D)!
-- Additionally, please follow the steps below:

--     to remove 3 old triggers from the person table;
--     to remove 3 old trigger functions;
--     to do a TRUNCATE (or DELETE) of all rows in our person_audit table.

-- DROP TRIGGER trg_person_insert_audit ON person;
-- DROP TRIGGER trg_person_update_audit ON person;
-- DROP TRIGGER trg_person_delete_audit ON person;

-- DROP FUNCTION fnc_trg_person_insert_audit;
-- DROP FUNCTION fnc_trg_person_update_audit;
-- DROP FUNCTION fnc_trg_person_delete_audit;

-- DELETE FROM person_audit;

CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER AS
$person_audit_trigger_fnk_body$ -- название блока тела функции
BEGIN
    IF (TG_OP = 'INSERT') THEN -- TG_OP переменная хранящая тип операции, вызв. триггер
        INSERT INTO person_audit (created, type_ivent, row_id,
                                  name, age, gender, address)
            VALUES (CURRENT_TIMESTAMP, 'I', new.id, new.name, new.age, new.gender, new.address);
    ELSIF ls(TG_OP = 'UPDATE') THEN -- TG_OP переменная хранящая тип операции, вызв. триггер
        INSERT INTO person_audit (created, type_ivent, row_id,
                                  name, age, gender, address)
            VALUES (CURRENT_TIMESTAMP, 'U', old.id, old.name, old.age, old.gender, old.address);
    ELSIF (TG_OP = 'DELETE') THEN -- TG_OP переменная хранящая тип операции, вызв. триггер
        INSERT INTO person_audit (created, type_ivent, row_id,
                                  name, age, gender, address)
            VALUES (CURRENT_TIMESTAMP, 'D', old.id, old.name, old.age, old.gender, old.address);
    END IF; -- закрытие блока IF
    RETURN NULL; -- функция триггера должна возвращать значение NULL, 
END;             -- чтобы не прерывать выполнение основной операции.
$person_audit_trigger_fnk_body$
LANGUAGE PLpgSQL;

CREATE TRIGGER trg_person_audit AFTER INSERT OR UPDATE OR DELETE
    ON person 
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address) 
    VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;

SELECT * FROM person_audit;


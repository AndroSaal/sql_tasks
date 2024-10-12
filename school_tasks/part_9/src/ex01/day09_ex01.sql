-- Let’s continue to implement our audit pattern for the person table.
-- Just define a trigger trg_person_update_audit and corresponding trigger
-- function fnc_trg_person_update_audit to handle all UPDATE traffic on the
-- person table. We should save the OLD states of all attribute values.

-- CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER AS
-- $person_audit_trigger_fnk_body$ -- название блока тела функции
-- BEGIN
--     IF (TG_OP = 'UPDATE') THEN -- TG_OP переменная хранящая тип операции, вызв. триггер
--         INSERT INTO person_audit (created, type_ivent, row_id,
--                                   name, age, gender, address)
--             VALUES (CURRENT_TIMESTAMP, 'U', old.id, old.name, old.age, old.gender, old.address);
--     END IF; -- закрытие блока IF
--     RETURN NULL; -- функция триггера должна возвращать значение NULL, 
-- END;             -- чтобы не прерывать выполнение основной операции.
-- $person_audit_trigger_fnk_body$
-- LANGUAGE PLpgSQL;

-- CREATE TRIGGER trg_person_update_audit AFTER UPDATE -- Создание триггера на update
--     ON person -- update в таблице персон
--     FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_update_audit(); --вызов триггерной функции 
--                                                                  --для каждой старой(попавшей под обновление) строки

-- UPDATE person SET name = 'Bulat' WHERE id = 10;
-- UPDATE person SET name = 'Damir' WHERE id = 10;

-- SELECT * FROM person_audit;

-- DELETE FROM person_audit;

-- UPDATE person SET name = 'Damir' WHERE id = 10;
-- DROP TRIGGER trg_person_update_audit ON person;
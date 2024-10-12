-- Finally, we need to handle DELETE statements and make a copy of the OLD
-- states for all attribute’s values. Please create a trigger trg_person_delete_audit
-- and corresponding trigger function fnc_trg_person_delete_audit.

CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS
$person_audit_trigger_fnk_body$ -- название блока тела функции
BEGIN
    IF (TG_OP = 'DELETE') THEN -- TG_OP переменная хранящая тип операции, вызв. триггер
        INSERT INTO person_audit (created, type_ivent, row_id,
                                  name, age, gender, address)
            VALUES (CURRENT_TIMESTAMP, 'D', old.id, old.name, old.age, old.gender, old.address);
    END IF; -- закрытие блока IF
    RETURN NULL; -- функция триггера должна возвращать значение NULL, 
END;             -- чтобы не прерывать выполнение основной операции.
$person_audit_trigger_fnk_body$
LANGUAGE PLpgSQL;

CREATE TRIGGER trg_person_delete_audit AFTER DELETE -- Создание триггера на delete
    ON person -- delete в таблице персон
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit(); --вызов триггерной функции 
                                                                 --для каждой старой(попавшей под удаление) строки

DELETE FROM person WHERE id = 10;

-- SELECT * FROM person_audit;
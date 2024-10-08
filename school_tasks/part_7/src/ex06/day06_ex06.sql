
--создание последовательности
CREATE SEQUENCE seq_person_discounts START WITH 1;

--модивикация поля таблицы -> установка id по умолчанию
ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');

--установка нового значения в последовательности как следующее +1 в поле id
SELECT setval('seq_person_discounts', (SELECT COUNT(id) + 1 FROM person_discounts));

SELECT * FROM seq_person_discounts;

-- DROP TABLE person_discounts;
-- DROP SEQUENCE seq_person_discounts_1_1;
-- DROP SEQUENCE seq_person_discounts;
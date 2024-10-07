-- Индексы создаются автоматически для каждого поля
-- PRIMARY KEY и UNIQUE, для внешний ключей нужно
-- создавать явно

-- DROP INDEX idx_pizzeria_id;
-- DROP VIEW bad_trip;
-- DROP TABLE roads_cost_cost;
-- DROP TABLE roads_cost;

-- Создание индексов если их не существует
CREATE INDEX IF NOT EXISTS idx_menu_pizzeria_id ON menu(pizzeria_id);
CREATE INDEX IF NOT EXISTS idx_person_order_person_id ON person_order(person_id);
CREATE INDEX IF NOT EXISTS idx_person_order_menu_id ON person_order(menu_id);
CREATE INDEX IF NOT EXISTS idx_person_visits_person_id ON person_visits(person_id);
CREATE INDEX IF NOT EXISTS idx_person_visits_pizzeria_id ON person_visits(pizzeria_id);

-- Проверка их наличия
SELECT * FROM pg_indexes
WHERE tablename = 'person_visits' OR
      tablename = 'menu' OR
      tablename = 'person_order';


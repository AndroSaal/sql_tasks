-- Write 2 SQL (DML) statements that delete all new orders from 
-- Exercise #12 based on the order date. Then delete "greek pizza" from the menu.

DELETE FROM person_order -- Делейтим все новые заказы
WHERE order_date='2022-02-25';

DELETE FROM menu -- Делейтим грецкую питсу
WHERE pizza_name='greek pizza';

SELECT * FROM person_order
WHERE order_date = '2022-02-25';

SELECT * FROM person;
-- Please change the price of "greek pizza" to -10% of the current value.

UPDATE menu
    SET price = 0.9*(SELECT price
                 FROM menu
                 WHERE pizza_name = 'greek pizza')
    WHERE pizza_name = 'greek pizza'

-- SELECT * FROM menu
-- WHERE pizza_name = 'greek pizza';
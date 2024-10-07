-- Please create a Database View v_price_with_discount that 
-- returns the orders of a person with person name, pizza name,
-- real price and calculated column discount_price (with applied
-- 10% discount and satisfying formula price - price*0.1). Please
-- sort the result by person names and pizza names and convert the
-- discount_price column to integer type.

CREATE VIEW v_price_with_discount AS
    SELECT p.name, m.pizza_name, m.price,
        (m.price - m.price*0.1) :: BIGINT AS discount_price
    FROM person_order po
    INNER JOIN person p ON p.id = po.person_id
    INNER JOIN menu m ON po.menu_id = m.id
    ORDER BY p.name, m.pizza_name;

-- SELECT * FROM v_price_with_discount;

-- DROP VIEW v_price_with_discount;
-- To comply with Data Governance Policies, you need to add
-- comments for the table and the table's columns. Let's apply
-- this policy to the person_discounts table. Please add English
-- or Russian comments (it is up to you) explaining what is a
-- business goal of a table and all its attributes.

-- COMMENT ON TABLE person_discounts IS 
-- 'This table contains information about the discounts for the customers.';

-- COMMENT ON COLUMN person_discounts.id IS 
-- 'Primary key';

-- COMMENT ON COLUMN person_discounts.person_id IS 
-- 'Foreign key to the person table';

-- COMMENT ON COLUMN person_discounts.pizzeria_id IS 
-- 'Foreign key to the pizzeria table';

-- COMMENT ON COLUMN person_discounts.discount IS 
-- 'numeric type discount depends on person_orders: 1 - 10.5, 2- 22, 3 - 33';

SELECT count(*) = 5 as check
FROM   pg_description
WHERE  objoid = 'person_discounts'::regclass




-- Please use 2 Database Views from Exercise #00 and 
-- write SQL to getfemale and male person names in one
-- list. Please specify the order by person name.

-- CREATE VIEW v_persons_female AS
--     (SELECT * FROM person
--     WHERE gender = 'female');
-- CREATE VIEW v_persons_male AS
--     (SELECT * FROM person
--     WHERE gender = 'male');

SELECT * FROM v_persons_male
UNION ALL
SELECT * FROM v_persons_female
ORDER BY name;
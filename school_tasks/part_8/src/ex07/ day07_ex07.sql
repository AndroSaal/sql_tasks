-- Write an SQL statement that returns a common average
-- rating (the output attribute name is global_rating) for
-- all restaurants. Round your average rating to 4 floating
-- point numbers.

-- SELECT name, ROUND(AVG(rating), 4) AS global_rating
-- FROM pizzeria
-- GROUP BY name
-- ORDER BY global_rating DESC;

SELECT ROUND(AVG(rating), 4) AS global_rating
FROM pizzeria;

SELECT * FROM pizzeria Where name = 'Pizza Hut';

UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';



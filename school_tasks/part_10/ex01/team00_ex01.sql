SELECT 
       tour || ',a}' AS tour,
       total_cost
FROM bad_trip
WHERE (total_cost = (SELECT MIN(total_cost)
                    FROM (SELECT total_cost FROM bad_trip) 
                    AS min_cost) 
OR total_cost = (SELECT MAX(total_cost)
                    FROM (SELECT total_cost FROM bad_trip)
                    AS max_cost))

-- SELECT * FROM pizzeria;
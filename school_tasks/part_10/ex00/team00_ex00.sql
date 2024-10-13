-- CREATE TABLE IF NOT EXISTS roads_cost(
--   point1 VARCHAR,
--   point2 VARCHAR,
--   cost BIGINT
-- );

-- INSERT INTO roads_cost(point1, point2, cost)
--     VALUES
--         ('a', 'b', 10),
--         ('b', 'a', 10),
--         ('a', 'c', 15),
--         ('c', 'a', 15),
--         ('a', 'd', 20),
--         ('d', 'a', 20),
--         ('b', 'd', 25),
--         ('d', 'b', 25),
--         ('d', 'c', 30),
--         ('c', 'd', 30),
--         ('b', 'c', 35),
--         ('c', 'b', 35);

-- SELECT * FROM roads_cost;

-- CREATE VIEW bad_trip AS 
-- (WITH RECURSIVE trip AS (
--     SELECT point1, point2,
--            ('{' || point1) AS tour,
--            cost AS total_cost
--     FROM roads_cost
--     WHERE point1 = 'a'
--     UNION
--     SELECT roads_cost.point1,
--            roads_cost.point2,
--            trip.tour || ',' || roads_cost.point1 AS tour,
--            (trip.total_cost + roads_cost.cost) AS total_cost
--     FROM trip
--     INNER JOIN roads_cost ON roads_cost.point1 = trip.point2
--     WHERE trip.tour NOT LIKE ('%'||roads_cost.point1||'%'))
-- SELECT * FROM trip
-- WHERE LENGTH(tour) = 8 AND point2 = 'a'
-- ORDER BY total_cost, tour);

-- SELECT
--        tour || ',a}' AS tour,
--        total_cost
-- FROM bad_trip
-- WHERE total_cost = (SELECT MIN(total_cost)
--                     FROM bad_trip)

-- DROP VIEW bad_trip;

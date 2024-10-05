WITH dataa(missing_date) AS (
    SELECT DISTINCT missing_date :: DATE 
    FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_date
    LEFT JOIN (
        SELECT * FROM person_visits pv
        WHERE pv.person_id = 1 OR pv.person_id = 2
    ) AS pv ON missing_date = pv.visit_date
    WHERE pv.visit_date IS NULL
    ORDER BY missing_date
)

SELECT * FROM dataa;
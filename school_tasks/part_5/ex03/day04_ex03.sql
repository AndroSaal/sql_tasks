-- Write a SQL statement that returns missing days for 
-- people's visits in January 2022. Use the v_generated_dates
-- view for this task and sort the result by the missing_date column.

SELECT n_query.missing_date
FROM (
    SELECT date_m AS missing_date
    FROM v_generated_dates
    LEFT OUTER JOIN person_visits ON date_m = visit_date
    WHERE visit_date IS NULL
) AS n_query
ORDER BY missing_date;
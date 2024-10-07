-- Please create a Database View (with name v_generated_dates)
-- which should "store" generated dates from January 1st to 
-- January 31st, 2022 in type DATE.

CREATE VIEW v_generated_dates AS
    SELECT date_m :: DATE FROM
    generate_series('2022-01-01', '2022-01-31', interval '1 day') AS date_m;

-- SELECT * FROM v_generated_dates;

-- DROP VIEW v_generated_dates;

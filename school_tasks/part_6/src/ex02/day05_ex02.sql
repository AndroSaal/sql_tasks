-- Please create a functional B-Tree index named idx_person_name
-- on the column name of the person table. The index should contain
-- person names in upper case. Write and provide any SQL with proof
-- (EXPLAIN ANALYZE) that index idx_person_name works.

CREATE INDEX IF NOT EXISTS idx_person_name 
    ON person(UPPER(name));
    
SET enable_seqscan = OFF;

EXPLAIN ANALYZE
    SELECT name FROM person 
    WHERE UPPER(name) = 'NATALY';
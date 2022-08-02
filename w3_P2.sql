CREATING INDEXES 

-- to get better idea of this topic go to "https://www.postgresqltutorial.com/postgresql-indexes/postgresql-create-index/"

-- - An index is a separated data structure e.g., B-Tree that speeds up the data retrieval
-- on a table at the cost of additional writes and storage to maintain it.

-- - We can create several types of indexes e.g B-Trees, hash, gist etc.
-- - in this section of the lesson we focues on B-trees and hashes.
-- -   The difference between using a b-tree and a hash table is that the
--     former allows you to use column comparisons in expressions that use
--     the =, >, >=, <, <=, or BETWEEN operators, while the latter is used
--     only for equality comparisons that use the = or <=> operators.-

-- syntax - 
CREATE INDEX index_name ON table_name [USING method]
(
    column_name [ASC | DESC] [NULLS {FIRST | LAST }],
    ...
);

first you would need to create a table.

CREATE TABLE textfun(
    content TEXT
);

CREATE INDEX textfun_b on textfun(content);

-- in the query above the type of index isn't specified. When this happens a B-tree is used by default.

-- - We create index to speed up searches at the cost of extra space.

-- - we can check this extra space by using the query below.

SELECT pg_relation_size('textfun'), pg_indexes_size('textfun');

-- To verify perfomance we need to add a large amount of data.

INSERT INTO textfun (content)
SELECT (CASE WHEN (random()< 0.5)
THEN 'https://www.pg4e.com/neon'
ELSE 'http://www.pg4e.com/LEMON'
END) || generate_series(100000,200000);

-- check the size of the data in ralation to the index to see how it grows with inputs.

SELECT pg_relation_size('textfun'), pg_indexes_size('textfun');


-- ANALYZING perfomance
-- B-tree index perfomance

explain analyze SELECT content FROM textfun WHERE content LIKE 'racing%';

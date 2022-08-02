-- This section is on performance of an index.

-- -To check performance we are going to create a table with 5000 records,
-- each record would be 4000 characters long.


CREATE TABLE cr2(
    id SERIAL,
    url TEXT
);

create unique index cr2_unique on cr2(url);

--inserting values 
INSERT INTO cr2(url) select 
repeat('NEON', 1000) || generate_series(1, 5000);

-- check and compare the size of the data

select pg_relation_size('cr2'), pg_indexes_size('cr2');

-- the index size in the above table is quite large and it can be reduced

DROP index cr2_unique;

-- we would make a new index on the md5 value of the url.

CREATE unique index cr2_md5 on cr2(md5(url));
select pg_relation_size('cr2'), pg_indexes_size('cr2');

-- we can see that the size of the index has reduced.

-- to check perfomance
explain analyze select * from cr2 where url = 'lemons';
explain analyze select * from cr2 where md5(url) = md5('lemons');


-- the index increases the speed of searches but there is a way
to make it faster.

CREATE TABLE cr3(
    id SERIAL,
    url TEXT,
    url_md5 uuid unique);

INSERT INTO cr3(url) select 
repeat('NEON', 1000) || generate_series(1, 5000);

update cr3 set url_md5 = md5(url)::uuid;

SELECT pg_relation_size('cr3'), pg_indexes_size('cr3');

explain analyze select * from cr3 where url_md5 = md5('lemons')::uuid;

/* we can see that the above query is executed faster */


--Using hashes 
-- Hashes are used for exact look up and they also take up less space when 
-- compared to B-trees.


CREATE TABLE cr4(
    id SERIAl,
    url TEXT
);

create index url_hash on cr4 using hash (url);

INSERT INTO cr4(url) select 
repeat('NEON', 1000) || generate_series(1, 5000);

--check the size

select pg_relation_size('cr4'), pg_indexes_size('cr4');

explain ANALYZE select * from cr4 where url = "lemons";








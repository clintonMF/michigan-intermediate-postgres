CREATE TABLE em(
    id SERIAL PRIMARY KEY,
    email VARCHAR(128)
);

INSERT INTO em(email) VALUES
    ('csev@umich.edu'),
    ('coleen@umich.edu'),
    ('sally@uiuc.edu'),
    ('ted79@umuc.edu'),
    ('glen1@apple.com'),
    ('nbody@apple.com');


SELECT email FROM em WHERE email ~ 'umich';

SELECT email FROM em WHERE email ~ '^c';

SELECT email FROM em WHERE email ~ 'edu$';

SELECT email FROM em WHERE email ~ '^[gnt]';

SELECT email FROM em WHERE email ~ '[0-9]';

SELECT email FROM em WHERE email ~ '[0-9][0-9]';

--To get the exact string out of the querry we use substring

SELECT substring(email FROM '[0-9]+')
 FROM em where email ~ '[0-9]';


SELECT substring(email FROM '.+@(.*)$')
 FROM em;
SELECT substring(email FROM '.@(.*)$')
 FROM em;
SELECT substring(email FROM '@(.*)$')
 FROM em; -- all 3 querries produce the same result.

SELECT DISTINCT substring(email FROM '.+@(.*)$') FROM em;

SELECT substring(email FROM '.+@(.*)$'), count(substring(email FROM '.+@(.*)$'))
FROM em GROUP BY substring(email FROM '.+@(.*)$');


-- To pick a set of characters multiple tiems regexp_matches()


CREATE TABLE tw 
    (   id SERIAL,
        tweet TEXT);

INSERT INTO tw(tweet) VALUES
('this is #SQL and #FUN stuff'),
('more people should learn #SQL from #UMSI'),
('#UMSI also teaches #PYTHON');

SELECT id, tweet from tw where tweet ~ 'SQL';

SELECT regexp_matches(tweet, '#[A-Za-z0-9]+', 'g') from tw;
SELECT DISTINCT regexp_matches(tweet, '#[A-Za-z0-9]+', 'g') from tw;







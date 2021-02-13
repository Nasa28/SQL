-- Winners from 1950

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

-- Who won the 1962 prize for Literature.
SELECT winner
FROM nobel
WHERE yr = 1962
  AND subject = 'Literature';

-- Year and subject that won 'Albert Einstein' his prize
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein' 

-- 'Peace' winners since the year 2000, including 2000

SELECT winner
FROM nobel
WHERE subject = 'Peace'
  AND yr >= 2000;


-- subject and winner of the Literature prize winners for 1980 to 1989 inclusive
SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature'
  AND yr >= 1980
  AND yr <= 1989;

-- Presidential winners
SELECT  *
FROM nobel
WHERE winner IN (
    'Theodore Roosevelt',
    'Woodrow Wilson',
    'Jimmy Carter',
    'Barack Obama'
  );


-- Winners with first name John

SELECT winner
FROM nobel
WHERE winner LIKE 'John%';

-- Physics winners for 1980 together with the Chemistry winners for 1984

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Physics'
  AND yr = 1980
  OR subject = 'Chemistry'
  AND yr = 1984;

-- Winners for 1980 excluding Chemistry and Medicine

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980
  AND subject NOT IN('Chemistry', 'Medicine');

-- People who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Medicine'
  AND yr < 1910
  OR subject = 'Literature'
  AND yr >= 2004 
  
  -- Details of the prize won by PETER GRÜNBERG

SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG';

-- Details of the prize won by EUGENE O'NEILL

SELECT *
FROM nobel
WHERE winner LIKE 'EUGENE O''NEILL';

--Knights of the realm

SELECT winner, yr, subject 
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC;

-- 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
ORDER BY subject IN('Chemistry', 'Physics'),subject, winner;

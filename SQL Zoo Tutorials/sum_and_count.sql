--1. Total world population

SELECT SUM(population)
FROM world;

-- 2. List of continents

SELECT DISTINCT continent
FROM world

-- 3. GDP of Africa

SELECT SUM(GDP)
FROM world
WHERE continent = 'Africa';

-- 4. Count the big countries

SELECT COUNT(name)
FROM world
WHERE area >= 1000000;

-- 5. Baltic states population

SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- 6. For each continent show the continent and number of countries.

SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

-- 7. For each continent show the continent and number of countries with populations of at least 10 million.

SELECT continent, COUNT(name)
FROM world
WHERE population >=10000000 GROUP BY continent;

--Counting big continents

--List the continents that have a total population of at least 100 million.

SELECT continent
  FROM world
 GROUP BY continent
HAVING SUM(population)>=100000000;
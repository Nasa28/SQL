-- show the name, continent and population of all countries
SELECT name, continent, population 
FROM world;

-- Countries with population of at least 200m

SELECT name
  FROM world
 WHERE population > 200000000;

 --Per capita GDP for country with over 200m population

SELECT name, gdp/population
FROM world
WHERE population > 200000000;

-- Population for the countries of the continent 'South America

SELECT name, population/1000000 
FROM world
WHERE continent = 'South America';

--Population of France, Germany, Italy

SELECT name, population 
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

--countries which have a name that includes the word 'United'

SELECT name 
FROM world
WHERE name LIKE '%United%';

--countries with area > 3m OR > 250m

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;

--One or the other (but not both)

SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000;

--Rounding

SELECT name, ROUND(population/1000000, 2), ROUND( gdp/1000000000, 2)
FROM world
WHERE continent = 'South America';

--Trillion dollar economies

SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp > 1000000000000;

--Name and capital have the same length

SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);

--Matching name and capital

SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND capital <> name;

--All the vowels

SELECT name
FROM world 
WHERE name 
NOT LIKE '% %'
AND name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%';



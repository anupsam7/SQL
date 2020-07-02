--show the population of Germany
SELECT population
FROM world
WHERE name = 'Germany'

--Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name
	,population
FROM world
WHERE name IN (
		'Sweden'
		,'Norway'
		,'Denmark'
		)

--Show the country and the area for countries with an area between 200,000 and 250,000.
SELECT name
	,area
FROM world
WHERE area BETWEEN 200000
		AND 250000

--Show the name for the countries that have a population of at least 200 million.
SELECT name
FROM world
WHERE population > 200000000

--Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name
	,gdp / population
FROM world
WHERE population >= 200000000

--Show the name and population in millions for the countries of the continent 'South America'.
SELECT name
	,population / 1000000
FROM world
WHERE continent = "South America"

--Show the name and population for France, Germany, Italy
SELECT name
	,population
FROM world
WHERE name IN (
		'France'
		,'Germany'
		,'Italy'
		)

--Show the countries which have a name that includes the word 'United'
SELECT name
FROM world
WHERE name LIKE '%United%'

--Show the countries that are big by area or big by population. Show name, population and area.
SELECT name
	,population
	,area
FROM world
WHERE area > 3000000
	OR population > 250000000

--Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both.
SELECT name
	,population
	,area
FROM world
WHERE area > 3000000
	XOR population > 250000000

-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'.
SELECT name
	,round(population / 1000000, 2)
	,round(gdp / 1000000000, 2)
FROM world
WHERE continent = 'South America'

-- Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
SELECT name
	,round(gdp / population, - 3)
FROM world
WHERE gdp >= 1000000000000

-- Greece has capital Athens. Each of the strings 'Greece', and 'Athens' has 6 characters.Show the name and capital where the name and the capital have the same number of characters.
SELECT name
	,capital
FROM world
WHERE length(name) = length(capital)

-- The capital of Sweden is Stockholm. Both words start with the letter 'S'.Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name
	,capital
FROM world
WHERE left(name, 1) = left(capital, 1)
	AND name <> capital

--Find the country that has all the vowels and no spaces in its name.
SELECT name
FROM world
WHERE name LIKE '%a%'
	AND name LIKE '%e%'
	AND name LIKE '%i%'
	AND name LIKE '%o%'
	AND name LIKE '%u%'
	AND name NOT LIKE '% %'

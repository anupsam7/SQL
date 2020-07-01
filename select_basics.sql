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

--

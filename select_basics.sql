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

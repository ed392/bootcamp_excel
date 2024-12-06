USE world;

/*
Task 1 -
Determining the total number of cities within the USA
*/
/*
Finding out what the USA'S code is.
*/
SELECT 
    Code, Name
FROM
    country;
# Counting the number of times USA code appears in the city table
SELECT 
    COUNT(CountryCode) AS NumberOfCities
FROM
    city
WHERE
    CountryCode = "USA";
    
/*
Task 2 -
Finding out what the population and average life expectancy for people in Argentina (ARG) is.
*/
SELECT 
    Code, Population, LifeExpectancy
FROM
    country
WHERE
    Code = 'ARG';
    
/*
Task 3 -
Identifing the country with the highest life expectancy. 
*/
SELECT 
    Name, LifeExpectancy
FROM
    country
ORDER BY LifeExpectancy DESC
LIMIT 1;

/*
Task 4 -
Compiling a list of all cities from around the world including the word 'New'.
*/
SELECT 
    Name
FROM
    country
WHERE
    Name LIKE '%New%';
    
/*
Task 5 -
List the first 10 cities by population in the database.
*/
SELECT 
    ID, Name, Population
FROM
    city
ORDER BY Population DESC
LIMIT 10;

/*
Task 6 -
Identifying cities from the database with populations exceeding 2 million.
*/
SELECT 
    Name, Population
FROM
    city
WHERE
    Population > 2000000;
    
/*
Task 7 -
Compiling a list of cities that start with the prefix 'Be'.
*/
SELECT
	Name
FROM
	city
WHERE Name LIKE 'Be%';

/*
Task 8 -
Identifying cities with populations ranging between 500,000 and 1 million.
*/
SELECT
	Name, Population
FROM
	city
WHERE Population > 500000 AND Population < 1000000;

/*
Task 9 -
Providing a sorted list of cities in ascending order by name.
*/
SELECT 
    Name
FROM
    city
ORDER BY Name ASC;

/*
Task 10 -
Identifying the most populated city.
*/
SELECT
	Name, Population
FROM
	city
ORDER BY Population DESC
LIMIT 1;

/*
Task 11 -
Providing a list of unique city names sorted alphabetically, along with their respective counts of occurrences.
*/
SELECT 
    Name, COUNT(Name) AS CityNameFrequency
FROM
    city
GROUP BY Name
ORDER BY Name ASC;

/*
Task 12 -
Identifying the least populated city.
*/
SELECT
	Name, Population
FROM
	city
ORDER BY Population ASC
LIMIT 1;

/*
Task 13 -
Identifying the most populated country.
*/
SELECT
	Name, Population
FROM
	country
ORDER BY Population DESC
LIMIT 1;

/*
Task 14 -
Identifying the capital of Spain.
*/
SELECT 
    country.Name AS CountryName, city.Name AS CapitalCityName
FROM
    country
        INNER JOIN
    city ON country.Capital = city.ID
WHERE
    country.Name = 'Spain';
    
/*
Task 15 -
Compiling a list of cities located in Europe.
*/
SELECT 
    country.Name AS CountryName, city.Name AS CityName
FROM
    country
        INNER JOIN
    city ON country.Code = city.CountryCode
WHERE
    country.Continent = 'Europe';

/*
Task 16 -
Calculating the average population for each country
*/
SELECT
	Name, Population
FROM
	country;

/*
Task 17 -
Comparing the populations of capital cities from different countries.
*/
SELECT
    country.Name AS CountryName,
    city.Name AS CapitalCityName,
    city.Population AS CapitalCityPopulation
FROM
    country
        INNER JOIN
    city ON country.Capital = city.ID;
    
/*
Task 18 -
Identifying countries with sparse populations.
*/
SELECT 
    Name, Population / SurfaceArea AS PopulationDensity
FROM
    country
WHERE
    Population/SurfaceArea <= 10
ORDER BY PopulationDensity ASC;

#BONUS TASKS
/*
Task 20 -
Providing data on cities ranked between 31st and 40th by population
*/
SELECT 
    *
FROM
    city
ORDER BY Population DESC
LIMIT 10 OFFSET 30;

/*
Task 21 -
Identifying all the languages spoken in this area of the world
*/
SELECT 
    countrylanguage.Language AS LanguagesSpokenInTheCaribbean
FROM
    country
        INNER JOIN
    countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE
    Region = 'Caribbean'
GROUP BY Language
ORDER BY Language;
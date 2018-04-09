/*
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/

SELECT SUM(population)
FROM (SELECT code, continent FROM country WHERE continent='asia') AS asiancountries
    LEFT JOIN city ON asiancountries.code=city.countrycode
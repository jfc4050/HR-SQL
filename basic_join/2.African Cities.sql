/*
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/

SELECT DISTINCT name
FROM (SELECT DISTINCT code FROM country WHERE continent='africa') AS africancountries
    LEFT JOIN city ON city.countrycode=africancountries.code
WHERE name IS NOT NULL
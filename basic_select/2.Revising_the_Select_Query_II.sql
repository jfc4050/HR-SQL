/*
Query the names of all American cities in CITY with populations larger than 120000. The CountryCode for America is USA.
*/

SELECT name
FROM city
WHERE 
    countrycode='USA' AND
    population > 120000
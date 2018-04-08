/*
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
Your result cannot contain duplicates.
*/

SELECT DISTINCT city
FROM station
WHERE 
    NOT city REGEXP '^[aeiou]' OR
    NOT city REGEXP '[aeiou]$'
;
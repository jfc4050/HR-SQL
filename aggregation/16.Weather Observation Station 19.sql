/*
Consider  and  to be two points on a 2D plane where  are the respective minimum and maximum values of Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in
*/

SELECT ROUND(POWER(POWER(MAX(lat_n)-MIN(lat_n), 2) + POWER(MAX(long_w)-MIN(long_w), 2), 1/2), 4)
FROM station
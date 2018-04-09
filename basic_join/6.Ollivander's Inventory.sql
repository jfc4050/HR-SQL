/*
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.
*/

SELECT
    wandprops.id,
    mincosts.age,
    mincosts.coins_needed,
    mincosts.power
FROM (
    SELECT 
        wands.power, 
        wands_property.age, 
        MIN(wands.coins_needed) AS coins_needed 
    FROM wands JOIN wands_property ON wands.code=wands_property.code 
    WHERE wands_property.is_evil=0
    GROUP BY
        wands.power,
        wands_property.age
     ) AS mincosts
    LEFT JOIN (
        SELECT 
            wands.id,
            wands.coins_needed,
            wands.power,
            wands_property.age
        FROM wands
            JOIN wands_property ON wands.code=wands_property.code
        WHERE wands_property.is_evil=0) AS wandprops 
        ON 
            wandprops.coins_needed=mincosts.coins_needed AND
            wandprops.power=mincosts.power AND
            wandprops.age=mincosts.age
ORDER BY
    mincosts.power DESC,
    mincosts.age DESC
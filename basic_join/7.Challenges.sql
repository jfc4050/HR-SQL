/*
Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.
*/

SELECT
    h.hacker_id,
    h.name,
    COUNT(c.challenge_id) AS challenge_count
FROM hackers h
    JOIN challenges c ON h.hacker_id=c.hacker_id
GROUP BY
    h.hacker_id,
    h.name
HAVING
    challenge_count=
    (SELECT MAX(t1.challenge_count) 
     FROM (
           SELECT COUNT(c.challenge_id) AS challenge_count
           FROM hackers h
              JOIN challenges c ON h.hacker_id=c.hacker_id
           GROUP BY
              h.hacker_id,
              h.name
           ) t1
     )
     OR
     challenge_count IN
     (SELECT t2.challenge_count
      FROM (
            SELECT count AS challenge_count
            FROM (SELECT COUNT(*) as count FROM challenges GROUP BY hacker_id) t3
            GROUP BY count
            HAVING COUNT(*)=1) t2
      )
ORDER BY
    challenge_count DESC,
    h.hacker_id ASC
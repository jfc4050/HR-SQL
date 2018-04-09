/*
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!
The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result.
*/

SELECT
    h.hacker_id,
    h.name,
    SUM(m.maxscore) AS totscore
FROM hackers h
    JOIN (
          SELECT
             h.hacker_id,
             MAX(s.score) AS maxscore
          FROM hackers h
             JOIN submissions s ON h.hacker_id=s.hacker_id
          GROUP BY
             h.hacker_id,
             s.challenge_id
         ) m ON m.hacker_id=h.hacker_id
GROUP BY
    h.hacker_id,
    h.name
HAVING totscore > 0
ORDER BY
    totscore DESC,
    h.hacker_id ASC
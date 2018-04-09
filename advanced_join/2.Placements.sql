/*
You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.
*/

SELECT student_name
FROM 
    (SELECT 
        s.name      AS student_name,
        p.salary    AS student_salary,
        f.friend_id 
     FROM students s
        JOIN friends  f ON f.id=s.id
        JOIN packages p ON p.id=s.id
    ) A
    
    JOIN
    
    (SELECT
        f.id     AS friend_id,
        p.salary AS friend_salary
     FROM friends f
        JOIN packages p ON p.id=f.id
    ) B
     
    ON A.friend_id=B.friend_id
     
WHERE friend_salary > student_salary
ORDER BY
    friend_salary ASC
/*
Amber's conglomerate corporation just acquired some new companies. 
Each of the companies follows this hierarchy: 
Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.
*/

SELECT
    c.company_code,
    c.founder,
    COUNT(DISTINCT l.lead_manager_code),
    COUNT(DISTINCT s.senior_manager_code),
    COUNT(DISTINCT m.manager_code),
    COUNT(DISTINCT e.employee_code)
FROM company c
    JOIN lead_manager l   ON l.company_code=c.company_code
    JOIN senior_manager s ON s.company_code=c.company_code
    JOIN manager m        ON m.company_code=c.company_code
    JOIN employee e       ON e.company_code=c.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code ASC;
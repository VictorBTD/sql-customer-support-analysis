-- Create Table
CREATE TABLE support_tickets (
    ticket_id INT,
    issue_type VARCHAR(50),
    priority VARCHAR(20),
    created_date DATE,
    resolved_date DATE,
    status VARCHAR(20)
);

-- Total tickets per issue type
SELECT issue_type, COUNT(*) AS total_tickets
FROM support_tickets
GROUP BY issue_type
ORDER BY total_tickets DESC;

-- Average resolution time
SELECT AVG(DATEDIFF(day, created_date, resolved_date)) AS avg_resolution_days
FROM support_tickets
WHERE resolved_date IS NOT NULL;

-- Tickets by priority
SELECT priority, COUNT(*) AS total
FROM support_tickets
GROUP BY priority;

-- Monthly ticket trends
SELECT 
    YEAR(created_date) AS year,
    MONTH(created_date) AS month,
    COUNT(*) AS total_tickets
FROM support_tickets
GROUP BY YEAR(created_date), MONTH(created_date)
ORDER BY year, month;

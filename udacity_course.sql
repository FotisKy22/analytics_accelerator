--Figure out the answer to this important question by writing a query that displays the order date and gloss_qty data for all orders where gloss_qty is between 24 and 29.
--When you use the BETWEEN operator in SQL, the results include the values of your endpoints.
SELECT id, occurred_at, gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29;

--Use the web_events table to find all information regarding individuals who were contacted via the organic or adwords channels, and started their account at any point in 2016, sorted from newest to oldest
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;

--Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.
SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
              AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
              AND primary_poc NOT LIKE '%eana%');

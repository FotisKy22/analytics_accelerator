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

--Provide a table for all web_events associated with account name of Walmart. There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event.
--Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.

select w.occurred_at, w.channel, a.primary_poc, a.name
from web_events as w
join accounts as a
on w.account_id = a.id
where a.name = 'Walmart';

--Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order
--A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.

select r.name as regions, a.name as accounts, o.total_amt_usd/(o.total+0.01) as unit_price 
from sales_reps as s
join region as r
on s.region_id = r.id
join accounts as a
on s.id = a.sales_rep_id
join orders as o
on o.account_id = a.id;

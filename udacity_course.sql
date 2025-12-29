-- Figure out the answer to this important question by writing a query that displays the order date and gloss_qty data for all orders where gloss_qty is between 24 and 29.
-- When you use the BETWEEN operator in SQL, the results include the values of your endpoints.
SELECT id, occurred_at, gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29;

/* Find all the orders that occurred in 2015. Your final table should have 4 columns: occurred_at, account name, order total, and order total_amt_usd.
 */

SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
  FROM orders o 
  JOIN accounts a
    ON a.id = o.account_id
  -- my mistake
  --WHERE o.occurred_at = '2015%'
  -- solution by instructor
  WHERE o.occurred_at BETWEEN '01-01-2015' AND '01-01-2016'
  ORDER BY o.occurred_at DESC

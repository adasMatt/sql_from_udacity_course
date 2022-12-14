/*Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. Your final table should have 3 columns: region name, account name, and unit price. Sort for the largest unit price first. In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01). */

SELECT r.name region, a.name account_name, o.total_amt_usd/(o.total+0.01) unit_price_paid
  FROM region r
  JOIN sales_reps s -- still need sales_reps for reference?
    ON s.region_id = r.id
  JOIN accounts a
    ON s.id = a.sales_rep_id
  JOIN orders o
    ON o.account_id = a.id
  WHERE o.standard_qty > 100 AND o.poster_qty > 50
  ORDER BY o.total_amt_usd/(o.total+0.01) DESC -- didn't realize I can in fact use the alias used up in SELECT here
  -- ORDER BY unit_price_paid DESC

/* instructor soln
SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price DESC;

*/
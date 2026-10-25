SELECT p.product_id, IFNULL(ROUND(SUM(p.price*u.units)/
                            SUM(u.units), 2), 0) AS average_price
FROM prices AS p LEFT JOIN unitssold AS u
ON p.product_id = u.product_id
AND u.purchase_date between p.start_date AND p.end_date
GROUP BY p.product_id

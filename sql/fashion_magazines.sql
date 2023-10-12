-- Add your sql here

SELECT
    cust.customer_name AS   [Customer]
    , printf("$%.2f", SUM(subs.price_per_month * subs.subscription_length)) AS [Amount Due]
FROM
    orders o
    JOIN customers cust ON cust.customer_id = o.customer_id
    JOIN subscriptions subs ON subs.subscription_id = o.subscription_id
WHERE
    o.order_status = 'unpaid'
    AND subs.description = 'Fashion Magazine'
GROUP BY
    cust.customer_name;
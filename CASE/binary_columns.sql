SELECT
    CUSTOMERID,
    COUNT(PRODUCTID) AS num_products,
    SUM(NUMBEROFUSERS) AS total_users,
    CASE WHEN COUNT(PRODUCTID) = 1
        OR SUM(NUMBEROFUSERS) >= 5000
        THEN 1 ELSE 0
    END AS upsell_opportunity
FROM
    subscriptions
GROUP BY
    customerId
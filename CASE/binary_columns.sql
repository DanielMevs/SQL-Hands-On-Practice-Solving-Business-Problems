SELECT
    customerid,
    COUNT(productId) AS num_products,
    SUM(numberOfUsers) AS total_users
    CASE WHEN COUNT(productId) = 1
        OR SUM(numberOfUsers) >= 5000
        THEN 1
        ELSE 0
        END AS upsell_opportunity
FROM
    subscriptions
GROUP BY
    customerId
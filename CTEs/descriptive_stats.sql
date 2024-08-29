WITH monthly_revs AS (
SELECT
    date_trunc('month', s.OrderDate) as ordermonth,
    p.productName,
    sum(s.revenue) AS revenue
FROM
    Subscriptions AS s
JOIN
    products AS p 
ON s.productId = p.producId
WHERE
    s.OrderDate between '2022-01-01' and '2022-12-31'
GROUP BY
    date_trunc('month', s.OrderDate), p.productName
)    

SELECT
    productname,
    min(revenue) AS min_rev,
    max(revenue) AS max_rev,
    avg(revenue) AS avg_rev,
    stddev(revenue) AS std_dev_rev
FROM
    monthly_revs
GROUP BY
    productname;
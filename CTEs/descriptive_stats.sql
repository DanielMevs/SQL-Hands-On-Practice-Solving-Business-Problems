with monthly_revs as (
SELECT
    date_trunc('month', s.OrderDate) as ordermonth,
    p.productName,
    sum(s.revenue) as revenue
FROM
    Subscriptions as s
JOIN
    products as p 
ON s.productId = p.producId
WHERE
    s.OrderDate between '2022-01-01' and '2022-12-31'
GROUP BY
    date_trunc('month', s.OrderDate), p.productName
)    

SELECT
    productname,
    min(revenue) as min_rev,
    max(revenue) as max_rev,
    avg(revenue) as avg_rev,
    stddev(revenue) as std_dev_rev
FROM
    monthly_revs
GROUP BY
    productname;
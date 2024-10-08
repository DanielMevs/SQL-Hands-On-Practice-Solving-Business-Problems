WITH MONTHLY_REVS AS (
    SELECT 
        DATE_TRUNC('month', ORDERDATE) as ORDER_MONTH, 
        SUM(REVENUE) as MONTHLY_REVENUE
    FROM 
        SUBSCRIPTIONS
    GROUP BY
        DATE_TRUNC('month', ORDERDATE)
)

SELECT 
    CURR.ORDER_MONTH AS CURRENT_MONTH,
    PREV.ORDER_MONTH AS PREVIOUS_MONTH,
    CURR.MONTHLY_REVENUE AS CURRENT_REVENUE,
    PREV.MONTHLY_REVENUE AS PREVIOUS_REVENUE
FROM
    MONTHLY_REVS AS CURR
JOIN
    MONTHLY_REVS AS PREV
ON
    DATEDIFF('month', PREV.ORDER_MONTH, CURR.ORDER_MONTH) = 1
WHERE
    CURR.MONTHLY_REVENUE > PREV.MONTHLY_REVENUE
    AND
    DATEDIFF('month', PREV.ORDER_MONTH, CURR.ORDER_MONTH) = 1;
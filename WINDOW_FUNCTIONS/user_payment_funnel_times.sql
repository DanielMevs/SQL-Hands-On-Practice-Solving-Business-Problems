SELECT
    *,
    LEAD(MOVEMENTDATE, 1)
        OVER(PARTITION BY SUBSCRIPTIONID
            ORDER BY MOVEMENTDATE)
                AS NEXTSTATUSMOVEMENTDATE,
    LEAD(MOVEMENTDATE, 1)
        OVER(PARTITION BY SUBSCRIPTIONID
            ORDER BY MOVEMENTDATE)
        - MOVEMENTDATE
        AS TIMEINSTATUS
FROM
    PAYMENTSTATUSLOG
WHERE
    SUBSCRIPTIONID = '38844'
ORDER BY
    MOVEMENTDATE
;
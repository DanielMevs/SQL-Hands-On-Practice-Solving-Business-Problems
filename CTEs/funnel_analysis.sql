WITH max_status_reached AS(
    SELECT
        subscriptionId,
        MAX(statusId) AS MaxStatus
    FROM
        paymentStatusLog
    GROUP BY
        subscriptionId
),
paymentFunnelStage AS (
    SELECT
        subs.subscriptionId,
        case when maxstatus = 1 then 'PaymentWidgetOpened'
            when maxstatus = 2 then 'PaymentEntered'
            when maxstatus = 3 and currentstatus = 0 then 'User Error with Payment Submission'
            when maxstatus = 3 and currentstatus != 0 then 'Payment Submitted'
            when maxstatus = 4 and currentstatus = 0 then 'Payment Processing Error with Vendor'
            when maxstatus = 4 and currentstatus != 0 then 'Payment Success'
            when maxstatus = 5 then 'Complete'
            when maxstatus is null then 'User did not start payment process'
            end as paymentFunnelStage
    FROM
        subscriptions AS subs
    LEFT JOIN
        max_status_reached AS m
    ON
        subs.subscriptionId = m.subscriptionId
)

SELECT
    paymentFunnelStage,
    COUNT(subscriptionId) as subscriptions
FROM
    paymentFunnelStage
GROUP BY
    paymentFunnelStage;
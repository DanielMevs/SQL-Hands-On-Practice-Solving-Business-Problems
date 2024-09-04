WITH all_cancelation_reasons AS (
    SELECT 
        SUBSCRIPTIONID,
        CANCELATIONREASON1 AS CANCELATIONREASON
    FROM
        CANCELATIONS
    UNION
    SELECT 
        SUBSCRIPTIONID,
        CANCELATIONREASON2 AS CANCELATIONREASON
    FROM
        CANCELATIONS
    UNION
    SELECT 
        SUBSCRIPTIONID,
        CANCELATIONREASON3 AS CANCELATIONREASON
    FROM
        CANCELATIONS
)

SELECT 
    CAST(COUNT(
        CASE WHEN CANCELATIONREASON = 'Expensive' 
        THEN SUBSCRIPTIONID END) AS float)
    / COUNT(DISTINCT SUBSCRIPTIONID) AS percent_expensive
FROM    
    all_cancelation_reasons;
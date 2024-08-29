WITH email_link_clicks AS(
SELECT
    userId,
    COUNT(*) AS num_link_clicks
FROM
    frontEndEventLog
WHERE
    eventId = 5
GROUP BY
    userId
)

SELECT
    num_link_clicks,
    COUNT(*) AS num_users
FROM
    email_link_clicks
GROUP BY
    num_link_clicks;
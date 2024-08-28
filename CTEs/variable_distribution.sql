with email_link_clicks as(
SELECT
    userId,
    COUNT(*) AS num_link_clicks
FROM
    frontEndEventLog el
WHERE
    eventId = 5
GROUP BY
    userId
)

SELECT
    num_link_clicks,
    COUNT(*) as num_users
FROM
    email_link_clicks
GROUP BY
    num_link_clicks;
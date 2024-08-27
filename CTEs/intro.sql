with num_users as(
SELECT
    customerid,
    sum(numberofusers) as total_users
FROM
    subscriptions
GROUP BY
    customerid;)

SELECT
    avg(total_users) as average_users
FROM
    num_users;
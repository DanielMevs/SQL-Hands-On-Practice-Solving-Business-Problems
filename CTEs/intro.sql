WITH num_users AS(
SELECT
    customerid,
    sum(numberofusers) AS total_users
FROM
    subscriptions
GROUP BY
    customerid;)

SELECT
    avg(total_users) AS average_users
FROM
    num_users;
# Write a solution to find the first login date for each player.

SELECT player_id
    , MIN(event_date) as first_login
FROM Activity
GROUP BY 1


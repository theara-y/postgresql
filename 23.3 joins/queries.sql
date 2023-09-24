-- write your queries here
SELECT * FROM owners
FULL JOIN vehicles
ON owners.id = vehicles.owner_id;

SELECT o.first_name, o.last_name, COUNT(*) FROM owners o
JOIN vehicles v
ON o.id = v.owner_id
GROUP BY (o.first_name, o.last_name)
ORDER BY COUNT(*) asc;


SELECT
    first_name,
    last_name,
    average_price,
    count
FROM (
    SELECT 
        o.first_name, 
        o.last_name, 
        CAST(AVG(v.price) AS INT) AS average_price,
        COUNT(*)
    FROM owners o
    JOIN vehicles v
    ON o.id = v.owner_id
    GROUP BY (o.first_name, o.last_name)
) AS T2
WHERE count > 1 AND average_price > 10000
ORDER BY first_name DESC;
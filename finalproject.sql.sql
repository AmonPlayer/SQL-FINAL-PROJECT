--This query will select neighboorhood and group them by their average price. Showing from highest to lowest.
SELECT an.neighbourhood_group, ROUND(AVG(an.price), 2) AS average_price
FROM AB_NYC an 
GROUP BY neighbourhood_group 
ORDER BY average_price DESC

--This query looks at how many listings a host has by looking at the count of IDs.
SELECT host_name, COUNT(id) AS num_of_listings
FROM AB_NYC an 
GROUP BY an.host_id 
ORDER BY num_of_listings DESC

--highest avaibility
SELECT an.host_name , availability_365, an.price 
FROM AB_NYC an 
ORDER BY an.availability_365 DESC, an.price  DESC
LIMIT 10

--lowest avaibility
SELECT an.host_name , availability_365, an.price 
FROM AB_NYC an 
ORDER BY an.availability_365 ASC, an.price  DESC
LIMIT 10

--Most entire homes by neighbourhood
SELECT an.neighbourhood_group,
       COUNT(*) AS count_entire_home
FROM AB_NYC an 
WHERE an.room_type = 'Entire home/apt'
GROUP BY an.neighbourhood_group
ORDER BY count_entire_home DESC;

-- This query uses a Common Table Expression (CTE) to calculate the overall
-- average price of Airbnb listings in New York City.
WITH avg_price AS (
    SELECT AVG(price) AS avg_price
    FROM AB_NYC
)
SELECT id, price
FROM AB_NYC
WHERE price > (SELECT avg_price FROM avg_price)
ORDER BY price DESC;




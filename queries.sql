-- Join 'owners' and 'vehicles'
SELECT o.id AS owner_id, o.first_name, o.last_name, v.id AS vehicle_id, v.make, v.model, v.year, v.price, v.owner_id
FROM owners o
FULL OUTER JOIN vehicles v ON o.id = v.owner_id
ORDER BY o.id, v.id;

-- Number of cars for each owner
SELECT owners.first_name, owners.last_name, COUNT(vehicles.id) AS count
FROM owners
LEFT JOIN vehicles ON owners.id = vehicles.owner_id
GROUP BY owners.id, owners.first_name, owners.last_name
ORDER BY owners.first_name ASC;

-- Display average price for each of the cars as integers
SELECT owners.first_name, owners.last_name, ROUND(AVG(vehicles.price), 2) AS average_price, COUNT(vehicles.id) AS count
FROM owners
JOIN vehicles ON owners.id = vehicles.owner_id
GROUP BY owners.first_name, owners.last_name
HAVING COUNT(vehicles.id) > 1 AND AVG(vehicles.price) > 10000
ORDER BY owners.first_name DESC;
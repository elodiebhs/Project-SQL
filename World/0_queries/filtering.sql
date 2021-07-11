SELECT Name, Continent FROM Country
WHERE Population < 100000 OR Population IS NULL
ORDER BY Population DESC;

-- res 47 rows

SELECT Name, Continent FROM Country
WHERE Population < 100000 OR Continent = 'oceania'
ORDER BY Population DESC;

SELECT Name, Continent FROM Country
WHERE Name LIKE '%island%'
ORDER BY Name;

SELECT Name FROM Country
WHERE name LIKE '_n%';
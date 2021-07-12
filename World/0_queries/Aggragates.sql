SELECT Region, Count(*)
FROM Country
GROUP BY Region;

SELECT AVG(Population) FROM Country;
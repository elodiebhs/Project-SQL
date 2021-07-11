
-- show only years
SELECT released, SUBSTR (released, 1,4) AS year FROM album;
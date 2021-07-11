-- Should not be any null row as they are set as NOT NULL as default.

--SELECT * FROM City WHERE name IS NULL;

SELECT * FROM City WHERE DISTRICT IS NOT NULL;
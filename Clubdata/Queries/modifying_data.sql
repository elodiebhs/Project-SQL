--Insert some data into table facilities
INSERT INTO facilities (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance) VALUES (9, 'Spa', 20, 30, 100000, 800);  

--Insert multiple rows of data into a table
INSERT INTO facilities VALUES (9, 'Spa', 20, 30, 100000, 800), (10, 'Squash Court 2', 3.5, 17.5, 5000, 80);

--Insert calculated data into a table
INSERT INTO facilities (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
SELECT  (
SELECT  MAX(facid)
FROM facilities) +1, 'Spa', 20, 30, 100000, 800;


--We made a mistake when entering the data for the second tennis court. The initial outlay was 10000 rather than 8000: you need to alter the data to fix the error.

UPDATE facilities

SET initialoutlay = 10000
WHERE facid = 1; 

--We want to increase the price of the tennis courts for both members and guests. Update the costs to be 6 for members, and 30 for guests.
UPDATE facilities

SET membercost = 6, guestcost = 30
WHERE facid IN (0, 1); 


--Insert some data into table facilities

INSERT INTO facilities (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance) VALUES (9, 'Spa', 20, 30, 100000, 800);  

--Insert multiple rows of data into a table

INSERT INTO facilities VALUES (9, 'Spa', 20, 30, 100000, 800), (10, 'Squash Court 2', 3.5, 17.5, 5000, 80);

--Insert calculated data into a table
INSERT INTO facilities (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
SELECT  (
SELECT  MAX(facid)
FROM facilities) +1, 'Spa', 20, 30, 100000, 800;

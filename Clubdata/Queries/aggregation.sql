--We want to know how many facilities exist
SELECT COUNT (*) FROM facilities;

--Produce a count of the number of facilities that have a cost to guests of 10 or more.

SELECT COUNT(*) FROM facilities WHERE guestcost >= 10;

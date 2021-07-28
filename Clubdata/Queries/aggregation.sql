--We want to know how many facilities exist
SELECT COUNT (*) FROM facilities;

--Produce a count of the number of facilities that have a cost to guests of 10 or more.
SELECT COUNT(*) FROM facilities WHERE guestcost >= 10;

--Produce a count of the number of recommendations each member has made. Order by member ID.
SELECT recommendedby, COUNT(*) FROM members
WHERE recommendedby IS NOT NULL
GROUP BY recommendedby
ORDER BY recommendedby;


--Produce a list of the total number of slots booked per facility.
SELECT facid, SUM(slots) AS "Total Slots" FROM bookings
GROUP BY facid
ORDER BY facid;
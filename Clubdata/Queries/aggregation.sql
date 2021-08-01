--We want to know how many facilities exist
SELECT  COUNT (*)
FROM facilities;
--Produce a count of the number of facilities that have a cost to guests of 10 or more.
SELECT  COUNT(*)
FROM facilities
WHERE guestcost >= 10;
--Produce a count of the number of recommendations each member has made.
ORDER BY member ID. 
SELECT  recommendedby 
       ,COUNT(*)
FROM members
WHERE recommendedby IS NOT NULL 
GROUP BY  recommendedby
ORDER BY recommendedby;
--Produce a list of the total number of slots booked per facility.
SELECT  facid 
       ,SUM(slots) AS "Total Slots"
FROM bookings
GROUP BY  facid
ORDER BY facid;
--Produce a list of the total number of slots booked per facility IN the month of September 2012
SELECT  facid 
       ,SUM(slots) AS "Total Slots"
FROM bookings
WHERE starttime >= '2012-09-01' 
AND starttime < '2012-10-01' 
GROUP BY  facid
ORDER BY SUM(slots);
--Produce a list of the total number of slots booked per facility per month IN the year of 2012
SELECT  facid 
       ,extract(month
FROM starttime) AS month, SUM(slots) AS "Total Slots"
FROM bookings
WHERE extract(year 
FROM starttime) = 2012
GROUP BY  facid 
         ,month
ORDER BY facid 
         ,month;
--Find the total number of members （including guests） who have made at least one booking.
SELECT  COUNT(DISTINCT memid)
FROM bookings;

--Produce a list of facilities with more than 1000 slots booked
SELECT facid, SUM(slots) AS "Total Slots" FROM bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid;

--Produce a list of facilities along with their total revenue
SELECT  facilities.name
       ,SUM(slots * CASE WHEN memid = 0 THEN facilities.guestcost else facilities.membercost end) AS revenue
FROM cd.bookings
INNER JOIN cd.facilities 
ON bookings.facid = facilities.facid
GROUP BY  facilities.name
ORDER BY revenue;   

--Produce a list of facilities with a total revenue less than 1000
SELECT  facilities.name
       ,SUM(CASE WHEN memid = 0 THEN slots * facilities.guestcost else slots * facilities.membercost end) as revenue
FROM bookings
INNER JOIN facilities
ON bookings.facid = facilities.facid
GROUP BY  facilities.name
HAVING SUM(CASE WHEN memid = 0 THEN slots * facilities.guestcost else slots * facilities.membercost end) < 1000
ORDER BY revenue; 

--Output the facility id that has the highest number of slots booked
SELECT  facid
       ,SUM(slots) AS "Total Slots"
FROM cd.bookings
GROUP BY  facid
ORDER BY SUM(slots) desc
LIMIT 1;

--Produce a list of the total number of slots booked per facility per month in the year of 2012
SELECT  facid
       ,extract(month
FROM starttime) AS month, SUM(slots) AS slots
FROM cd.bookings
WHERE starttime >= '2012-01-01' 
AND starttime < '2013-01-01' 
GROUP BY  rollup(facid,month)
ORDER BY facid
         ,month; 
--ROLLUP produces a hierarchy of aggregations in the order passed into 


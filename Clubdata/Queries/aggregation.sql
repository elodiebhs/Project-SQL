--We want to know how many facilities exist
SELECT  COUNT (*)
FROM facilities;

--Produce a count of the number of facilities that have a cost to guests of 10 or more.
SELECT  COUNT(*)
FROM facilities
WHERE guestcost >= 10; 

--Produce a count of the number of recommendations each member has made. Order by member ID.
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

--Produce a list of the total number of slots booked per facility in the month of September 2012
SELECT  facid
       ,SUM(slots) AS "Total Slots"
FROM bookings
WHERE starttime >= '2012-09-01' 
AND starttime < '2012-10-01' 
GROUP BY  facid
ORDER BY SUM(slots); 

--Produce a list of the total number of slots booked per facility per month in the year of 2012
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
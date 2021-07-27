--produce a list of the start times for bookings by members named 'David Farrell
SELECT  starttime
FROM bookings
JOIN members
ON members.memid = bookings.memid
WHERE members.firstname = 'David' 
AND members.surname = 'Farrell';

--produce a list of the start times for bookings for tennis courts for the date '2012-09-21'. Return a list of start time 
--AND facility name pairings ordered by the time. 
SELECT  starttime AS start 
       ,name
FROM bookings
JOIN facilities
ON bookings.facid = facilities.facid
WHERE name LIKE '%Tennis Court%' 
AND starttime >= '2012-09-21' 
AND starttime < '2012-09-22'
ORDER BY start;

--output a list of all members who have recommended another member. Ensure that there are no duplicates IN the list 
--AND that results are ordered by （surname firstname） 
SELECT  distinct recs.firstname AS firstname 
       ,recs.surname            AS surname
FROM members mems
INNER JOIN members recs
ON recs.memid = mems.recommendedby
ORDER BY surname, firstname;

--output a list of all members including the individual who recommended them （if any）
SELECT  mem.firstname AS memfname 
       ,mem.surname   AS memsname 
       ,rec.firstname AS recfname 
       ,rec.surname   AS recsname
FROM members mem
LEFT OUTER JOIN members rec
ON rec.memid = mem.recommendedby
ORDER BY memsname, memfname;

--Produce a list of all members who have used a tennis court
SELECT  DISTINCT CONCAT(members.firstname,' ' ,members.surname) AS member 
       ,facilities.name                                         AS facility
FROM members
JOIN bookings
ON members.memid = bookings.memid
JOIN facilities
ON bookings.facid = facilities.facid
WHERE facilities.name IN ('Tennis Court 2', 'Tennis Court 1')
ORDER BY member, facility;

--produce a list of bookings 
--ON the day of 2012-09-14 which will cost the member （or guest） more than $30
SELECT  CONCAT(members.firstname,' ' ,members.surname)                                                                      AS member 
       ,facilities.name                                                                                                     AS facility 
       ,CASE WHEN members.memid = 0 THEN bookings.slots*facilities.guestcost  ELSE bookings.slots*facilities.membercost END AS cost
FROM members
JOIN bookings
ON members.memid = bookings.memid
JOIN facilities
ON bookings.facid = facilities.facid
WHERE bookings.starttime >= '2012-09-14' 
AND bookings.starttime < '2012-09-15' 
AND ( (members.memid = 0 AND bookings.slots*facilities.guestcost > 30) OR (members.memid != 0 AND bookings.slots*facilities.membercost > 30) )
ORDER BY cost desc;

-- output a list of all members including the individual who recommended them （if any） without USING any joins 
SELECT  DISTINCT members.firstname || ' ' || members.surname AS member 
       ,(
SELECT  recs.firstname || ' ' || recs.surname AS recommender
FROM members recs
WHERE recs.memid = members.recommendedby ) 
FROM members
ORDER BY member;

--Produce a list of costly bookings USING a subquery
SELECT  member
       ,facility
       ,cost
FROM (
SELECT  members.firstname || ' ' || members.surname                                                                                  AS member 
       ,facilities.name                                                                                                                 AS facility 
       ,CASE WHEN members.memid = 0 THEN bookings.slots*facilities.guestcost  ELSE bookings.slots*facilities.membercost END AS cost
FROM members
INNER JOIN bookings
ON members.memid = bookings.memid
INNER JOIN facilities
ON bookings.facid = facilities.facid
WHERE bookings.starttime >= '2012-09-14' 
AND bookings.starttime < '2012-09-15' ) AS bookings 
WHERE cost > 30
ORDER BY cost desc;  
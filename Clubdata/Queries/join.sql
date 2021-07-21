--produce a list of the start times for bookings by members named 'David Farrell
SELECT starttime FROM bookings
JOIN members ON members.memid = bookings.memid
WHERE members.firstname = 'David' AND members.surname = 'Farrell';

--produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'. Return a list of start time and facility name pairings, ordered by the time.
SELECT starttime as start, name FROM bookings
JOIN facilities ON bookings.facid = facilities.facid
WHERE name LIKE '%Tennis Court%'
AND starttime >= '2012-09-21' AND starttime < '2012-09-22'
ORDER BY start;
--produce a list of the start times for bookings by members named 'David Farrell
SELECT starttime FROM bookings
JOIN members ON members.memid = bookings.memid
WHERE members.firstname = 'David' AND members.surname = 'Farrell';
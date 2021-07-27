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

--output a list of all members who have recommended another member. Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname)

select distinct recs.firstname as firstname, recs.surname as surname
FROM  members mems
inner join members recs
ON recs.memid = mems.recommendedby
ORDER BY surname, firstname;

--output a list of all members, including the individual who recommended them (if any)

SELECT mem.firstname as memfname, mem.surname as memsname, rec.firstname as recfname, rec.surname as recsname
FROM members mem
LEFT OUTER JOIN members rec 
ON rec.memid = mem.recommendedby 
order by memsname, memfname;

--Produce a list of all members who have used a tennis court
SELECT DISTINCT CONCAT(members.firstname, ' ' ,members.surname) as member, facilities.name as facility
FROM members
JOIN bookings ON members.memid = bookings.memid
JOIN facilities ON bookings.facid = facilities.facid
WHERE facilities.name in ('Tennis Court 2','Tennis Court 1')
order by member, facility;

--produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30
SELECT CONCAT(members.firstname, ' ' ,members.surname) as member, facilities.name as facility,
CASE WHEN members.memid = 0 then bookings.slots*facilities.guestcost
		else bookings.slots*facilities.membercost
end as cost
FROM members
JOIN bookings ON members.memid = bookings.memid
JOIN facilities ON bookings.facid = facilities.facid
WHERE
		bookings.starttime >= '2012-09-14' AND 
		bookings.starttime < '2012-09-15' AND (
			(members.memid = 0 AND bookings.slots*facilities.guestcost > 30) OR
			(members.memid != 0 AND bookings.slots*facilities.membercost > 30)
		)
ORDER BY cost desc;

-- output a list of all members, including the individual who recommended them (if any), without using any joins
SELECT DISTINCT members.firstname || ' ' ||  members.surname as member,
	(SELECT recs.firstname || ' ' || recs.surname as recommender 
		FROM members recs 
		WHERE recs.memid = members.recommendedby
	)
	FROM members
ORDER BY member;     
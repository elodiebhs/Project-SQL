--everything from table facilities
SELECT * FROM facilities;

--print out a list of all of the facilities and their cost to members
SELECT name, membercost FROM facilities;

--list of facilities that charge a fee to members
SELECT * FROM facilities
WHERE membercost>0 AND guestcost>0 AND initialoutlay>0 AND monthlymaintenance>0;

--list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost
SELECT facid, name, membercost, monthlymaintenance FROM facilities
WHERE membercost > 0 AND (membercost < monthlymaintenance / 50.0);


--produce a list of all facilities with the word 'Tennis' in their name
SELECT * FROM facilities
WHERE name like '%Tennis%';

--retrieve the details of facilities with ID 1 and 5
SELECT * FROM facilities
WHERE facid IN (1,5); 

--produce a list of facilities, with each labelled as 'cheap' or 'expensive' depending on if their monthly maintenance cost is more than $100. Return the name and monthly maintenance of the facilities in question.
SELECT name, 
	case when (monthlymaintenance > 100) then 'expensive'
	else 'cheap'
	end as cost 

FROM facilities;

-- produce a list of members who joined after the start of September 2012. Return the memid, surname, firstname, and joindate of the members in question.
SELECT memid, surname, firstname, joindate FROM members
WHERE joindate >= '2012-09-01'; 

--produce an ordered list of the first 10 surnames in the members table. The list must not contain duplicates.
SELECT DISTINCT surname FROM members
ORDER BY surname
LIMIT 10;

--combined list of all surnames and all facility names
SELECT surname FROM members
UNION
SELECT name from facilities;

--get the signup date of your last member
SELECT joindate as latest FROM members
ORDER BY latest DESC
LIMIT 1;

SELECT max(joindate) as latest
FROM members;

--get the first and last name of the last member(s) who signed up - not just the date
SELECT firstname, surname, joindate
FROM members
ORDER BY joindate DESC
LIMIT 1;